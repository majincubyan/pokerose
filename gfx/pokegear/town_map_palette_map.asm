	const_def
	const PAL_TOWNMAP_SHRINE   ; 0
	const PAL_TOWNMAP_EARTH    ; 1
	const PAL_TOWNMAP_MOUNTAIN ; 2
	const PAL_TOWNMAP_CITY     ; 3
	const PAL_TOWNMAP_FOREST   ; 4
	const PAL_TOWNMAP_POI  ; 5
	const PAL_TOWNMAP_PATH     ; 6
	const PAL_TOWNMAP_PATH_MTN ; 7



townmappals: MACRO
rept _NARG / 2
	dn PAL_TOWNMAP_\2, PAL_TOWNMAP_\1
	shift
	shift
endr
ENDM

; gfx/pokegear/town_map.png
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, PATH,     SHRINE
	townmappals PATH,     PATH,     CITY,     EARTH,    CITY,     POI,      PATH,     POI
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, SHRINE,   SHRINE
	townmappals PATH,     PATH,     PATH,     PATH,     MOUNTAIN, SHRINE,   EARTH,    EARTH
	townmappals EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, CITY,     CITY
	townmappals PATH,     PATH,     PATH,     PATH,     EARTH,    EARTH,    EARTH,    EARTH
	townmappals PATH,     PATH,     PATH,     PATH,     PATH,     PATH,     PATH,     MOUNTAIN
	townmappals SHRINE,   POI,      PATH,     PATH,     PATH,     PATH,     PATH,     PATH
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     PATH
	townmappals CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY,     CITY
	townmappals PATH,     PATH,     PATH,     PATH,     PATH,     PATH,     PATH,     PATH
	townmappals EARTH,    EARTH,    EARTH,    EARTH,    MOUNTAIN, MOUNTAIN, MOUNTAIN, MOUNTAIN
	townmappals PATH,     PATH,     PATH,     PATH,     PATH,     PATH,     PATH,     PATH
	townmappals PATH,     PATH,     PATH_MTN, PATH_MTN, PATH_MTN, PATH_MTN, PATH_MTN, PATH_MTN
	townmappals EARTH,    FOREST,      FOREST,      PATH,     PATH,      PATH,      PATH,      PATH
