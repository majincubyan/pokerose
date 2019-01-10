TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, JOLTIK,    10
	db 15, JOLTIK,    10
	db 15, JOLTIK,    10
	db 10, LUCARIO,      10
	db  5, LUCARIO,      10
	db  5, LUCARIO,      10
	db -1
; rare
	db 50, JOLTIK,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, LUCARIO,      10
	db  5, LUCARIO,      10
	db  5, LUCARIO,      10
	db -1

TreeMonSet_Town:
; common
	db 50, JOLTIK,    10
	db 15, EKANS,      10
	db 15, JOLTIK,    10
	db 10, LUCARIO,      10
	db  5, LUCARIO,      10
	db  5, LUCARIO,      10
	db -1
; rare
	db 50, JOLTIK,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, LUCARIO,      10
	db  5, LUCARIO,      10
	db  5, LUCARIO,      10
	db -1

TreeMonSet_Route:
; common
	db 50, PHANTUMP,   10
	db 15, AMAURA,   10
	db 15, DRILBUR,     10
	db 10, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db -1
; rare
	db 50, PHANTUMP,   10
	db 15, LITLEO,     10
	db 15, LITLEO,     10
	db 10, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db -1

TreeMonSet_Kanto:
; common
	db 50, PHANTUMP,   10
	db 15, EKANS,      10
	db 15, PHANTUMP,   10
	db 10, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db -1
; rare
	db 50, PHANTUMP,   10
	db 15, LITLEO,     10
	db 15, LITLEO,     10
	db 10, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, PHANTUMP,   10
	db 15, SPOINK,    10
	db 15, PHANTUMP,   10
	db 10, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db -1
; rare
	db 50, PHANTUMP,   10
	db 15, LITLEO,     10
	db 15, LITLEO,     10
	db 10, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db  5, MAGNEZONE,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, PHANTUMP,   10
	db 15, LITLEO,     10
	db 15, LITLEO,     10
	db 10, TREVENANT,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1
; rare
	db 50, PHANTUMP,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, PHANTUMP,   10
	db  5, METAPOD,    10
	db  5, KAKUNA,     10
	db -1

TreeMonSet_Rock:
	db 90, RHYPERIOR,     15
	db 10, TOUCANNON,    15
	db -1
