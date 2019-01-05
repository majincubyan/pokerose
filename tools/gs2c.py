#!/usr/bin/env python

from __future__ import print_function

import sys
import os.path

def parseint(s):
	if s.startswith('$'):
		return int(s[1:], 16)
	return int(s)

def hexint(n):
	return '$' + hex(n)[2:].upper()

def convert(filename):
	lines = []
	with open(filename, 'r') as f:
		for line in f:
			line = line.strip()
			line = convert_line(line)
			if not(line.startswith(';') or line.endswith(':') or not line):
				line = '\t\t' + line
			lines.append(line)
	return '\n'.join(lines)

def convert_line(line):
	# Example: db oct0 == octave 1
	# Example: db oct5 == octave 6
	if line.startswith('db oct'):
		octave = parseint(line[6:]) + 1
		return 'octave %s' % (octave,)

	# Example: db (ntA# | 0) == note A#, 1
	# Example: db (ntRst | 3) == note __, 4
	if line.startswith('db (nt'):
		_, note, _, length = line.split(None, 3)
		note = note.lstrip('(')[2:]
		length = length.rstrip(')')
		if note == 'Rst':
			note = '__'
		elif not note.endswith('#'):
			note += '_'
		length = parseint(length) + 1
		return 'note %s, %s' % (note, length)

	# Example: pkmsSetVel 1, 3 == intensity $13
	if line.startswith('pkmsSetVel'):
		_, vel, length = line.split(None, 2)
		vel = parseint(vel.rstrip(','))
		length = parseint(length)
		intensity = hexint((vel << 4) | length)
		return 'intensity %s' % (intensity,)

	# Example: pkmsSetNtr $C, 9, 4 == notetype $C, $94
	if line.startswith('pkmsSetNtr'):
		_, speed, vel, length = line.split(None, 3)
		speed = parseint(speed.rstrip(','))
		vel = parseint(vel.rstrip(','))
		length = parseint(length)
		intensity = hexint((vel << 4) | length)
		return 'notetype %s, %s' % (speed, intensity)

	# Example: pkmsSetDSpeed $C == notetype $C
	if line.startswith('pkmsSetDSpeed'):
		_, speed = line.split(None, 1)
		return 'notetype %s' % (speed,)

	# Example: pkmsEndSound == endchannel
	if line.startswith('pkmsEndSound'):
		return 'endchannel'

	# Example: pkmsSetMod $C, 1, 2 == vibrato $C, $12
	if line.startswith('pkmsSetMod'):
		_, delay, depth, rate = line.split(None, 3)
		delay = delay.rstrip(',')
		depth = parseint(depth.rstrip(','))
		rate = parseint(rate)
		extent = hexint((depth << 4) | rate)
		return 'notetype %s, %s' % (delay, extent)

	# Example: pkmsSetDuty 2 == dutycycle 2
	if line.startswith('pkmsSetDuty'):
		_, duty = line.split(None, 1)
		return 'dutycycle %s' % (duty,)

	# Example: pkmsSetDrums 5 == togglenoise 5
	if line.startswith('pkmsSetDrums'):
		_, drums = line.split(None, 1)
		return 'togglenoise %s' % (drums,)

	# Example: pkmsSetArp $C == unknownmusic0xde $C
	if line.startswith('pkmsSetArp'):
		_, x = line.split(None, 1)
		return 'unknownmusic0xde %s' % (x,)

	# Example: pkmsSetTempo 0, $80 == tempo $80
	if line.startswith('pkmsSetTempo'):
		_, divider, modifier = line.split(None, 2)
		divider = divider.rstrip(',')
		hi = parseint(divider)
		lo = parseint(modifier)
		tempo = hexint((hi << 8) | lo)
		return 'tempo %s' % (tempo,)

	# Example: pkmsSetVolume $77 == volume $77
	if line.startswith('pkmsSetVolume'):
		_, volume = line.split(None, 1)
		return 'volume %s' % (volume,)

	# Example: pkmsCall NewSong_Channel1 + SONG_START == callchannel NewSong_Channel1
	if line.startswith('pkmsCall'):
		_, offset = line.split(None, 1)
		offset = offset.replace('+ SONG_START', '')
		return 'callchannel %s' % (offset,)

	# Example: pkmsJump Channel1_Loop + SONG_START == loopchannel 0, Channel1_Loop
	if line.startswith('pkmsJump'):
		_, offset = line.split(None, 1)
		offset = offset.replace('+ SONG_START', '')
		return 'loopchannel 0, %s' % (offset,)

	if line.startswith(';') or line.endswith(':') or not line:
		return line

	return line + ' ; WARNING: unconverted'

def write(content, old_filename):
	name, ext = os.path.splitext(old_filename)
	new_filename = name + '_c' + '.' + ext
	with open(new_filename, 'w') as f:
		f.write(content)

def main():
	if len(sys.argv) < 2:
		print('Usage: gs2c.py filename.asm', file=sys.stderr)
		sys.exit(1)
	filename = sys.argv[1]
	content = convert(filename)
	write(content, filename)

if __name__ == '__main__':
	main()