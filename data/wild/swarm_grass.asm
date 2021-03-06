; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 3, GEODUDE
	db 3, BRONZOR
	db 2, POOCHYENA
	db 2, GEODUDE
	db 2, BRONZOR
	db 4, BRONZOR
	db 4, BRONZOR
	; day
	db 3, GEODUDE
	db 3, BRONZOR
	db 2, POOCHYENA
	db 2, GEODUDE
	db 2, BRONZOR
	db 4, BRONZOR
	db 4, BRONZOR
	; nite
	db 3, GEODUDE
	db 3, BRONZOR
	db 2, POOCHYENA
	db 2, GEODUDE
	db 2, BRONZOR
	db 4, BRONZOR
	db 4, BRONZOR

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, LUDICOLO
	db 14, LUDICOLO
	db 14, STARLY
	db 10, DITTO
	db 10, DITTO
	; day
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, LUDICOLO
	db 14, LUDICOLO
	db 14, STARLY
	db 10, DITTO
	db 10, DITTO
	; nite
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, LUDICOLO
	db 14, LUDICOLO
	db 14, PHANTUMP
	db 10, DITTO
	db 10, DITTO

	db -1 ; end
