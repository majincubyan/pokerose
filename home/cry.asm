PlayStereoCry::
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	call _PlayMonCry
	call WaitSFX
	ret

PlayStereoCry2::
; Don't wait for the cry to end.
; Used during pic animations.
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	jp _PlayMonCry

PlayMonCry::
	call PlayMonCry2
	call WaitSFX
	ret

PlayMonCry2::
; Don't wait for the cry to end.
	push af
	xor a
	ld [wStereoPanningMask], a
	ld [wCryTracks], a
	pop af
	call _PlayMonCry
	ret

PlayFaintingCry::
	call PlayFaintingCry2
	jp WaitSFX
	
PlayFaintingCry2::
	push hl
	push de
	push bc
	
	call LoadCry
	jr c, .ded
	ld hl, CryPitch
	ld a, 90 percent
	call .Multiply
	ld a, [hProduct + 2]
	ld [hli], a
	ld a, [hProduct + 1]
	ld [hli], a

	ld a, 11 percent
	call .Multiply
	ld a, [hProduct + 2]
	add [hl]
	ld [hli], a
	ld a, [hProduct + 1]
	adc [hl]
	ld [hl], a

	farcall _PlayCryHeader
	jr PlayCry_PopBCDEHLOff

.ded
	ld e, 1
	call PlayDEDCry
	jr PlayCry_PopBCDEHLOff

.Multiply
	ld [hMultiplier], a
	ld a, [hli]
	ld [hMultiplicand + 2], a
	ld a, [hld]
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand], a
	ld [hProduct], a
	jp Multiply

_PlayMonCry::
	push hl
	push de
	push bc

	call GetCryIndex
	call nc, PlayCry
PlayCry_PopBCDEHLOff:
	pop bc
	pop de
	pop hl
	ret

LoadCry::
; Load cry bc.

	call GetCryIndex
	ret c

	ldh a, [hROMBank]
	push af
	ld a, BANK(PokemonCries)
	rst Bankswitch

	ld a, [hli]
	cp $ff
	jr z, .ded
	
	ld d, 0
	ld e, a

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	pop af
	rst Bankswitch
	and a
	ret

.ded
	call LoadDEDCryHeader
	pop af
	rst Bankswitch
	scf
	ret

GetCryIndex::
	and a
	jr z, .no
	cp EGG
	jr z, .no
	cp NUM_POKEMON + 1
	jr nc, .no

	dec a
	ld c, a
	ld b, 0
	ld hl, PokemonCries
	ld a, 5
	call AddNTimes
	and a
	ret

.no
	scf
	ret
