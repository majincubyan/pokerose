phone: MACRO
; trainer class, trainer id, map, time 1, script 1, time 2, script 2
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,   PLAYERS_HOUSE_1F, ANYTIME, MomPhoneScript,      0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,      0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,  N_A,              ANYTIME, BillPhoneScript1,    0,       BillPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_ELM,   ELMS_LAB,         ANYTIME, ElmPhoneScript1,     0,       ElmPhoneScript2
	phone SCHOOLBOY,    JACK1,              NATIONAL_PARK,    ANYTIME, JackPhoneScript1,    ANYTIME, JackPhoneScript2
	phone POKEFANF,     BEVERLY1,           NATIONAL_PARK,    ANYTIME, BeverlyPhoneScript1, ANYTIME, BeverlyPhoneScript2
	phone SAILOR,       HUEY1,              OLIVINE_LIGHTHOUSE_2F, ANYTIME, HueyPhoneScript1, ANYTIME, HueyPhoneScript2
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone COOLTRAINERM, GAVEN3,             ROUTE_20,         ANYTIME, GavenPhoneScript1,   ANYTIME, GavenPhoneScript2
	phone COOLTRAINERF, BETH1,              ROUTE_20,         ANYTIME, BethPhoneScript1,    ANYTIME, BethPhoneScript2
	phone BIRD_KEEPER,  JOSE2,              ROUTE_20,         ANYTIME, JosePhoneScript1,    ANYTIME, JosePhoneScript2
	phone COOLTRAINERF, REENA1,             ROUTE_20,         ANYTIME, ReenaPhoneScript1,   ANYTIME, ReenaPhoneScript2
	phone YOUNGSTER,    JOEY1,              ROUTE_20,         ANYTIME, JoeyPhoneScript1,    ANYTIME, JoeyPhoneScript2
	phone BUG_CATCHER,  WADE1,              ROUTE_20,         ANYTIME, WadePhoneScript1,    ANYTIME, WadePhoneScript2
	phone FISHER,       RALPH1,             ROUTE_20,         ANYTIME, RalphPhoneScript1,   ANYTIME, RalphPhoneScript2
	phone PICNICKER,    LIZ1,               ROUTE_20,         ANYTIME, LizPhoneScript1,     ANYTIME, LizPhoneScript2
	phone HIKER,        ANTHONY2,           ROUTE_20,         ANYTIME, AnthonyPhoneScript1, ANYTIME, AnthonyPhoneScript2
	phone CAMPER,       TODD1,              ROUTE_20,         ANYTIME, ToddPhoneScript1,    ANYTIME, ToddPhoneScript2
	phone PICNICKER,    GINA1,              ROUTE_20,         ANYTIME, GinaPhoneScript1,    ANYTIME, GinaPhoneScript2
	phone JUGGLER,      IRWIN1,             ROUTE_20,         ANYTIME, IrwinPhoneScript1,   ANYTIME, IrwinPhoneScript2
	phone BUG_CATCHER,  ARNIE1,             ROUTE_20,         ANYTIME, ArniePhoneScript1,   ANYTIME, ArniePhoneScript2
	phone SCHOOLBOY,    ALAN1,              ROUTE_20,         ANYTIME, AlanPhoneScript1,    ANYTIME, AlanPhoneScript2
	phone TRAINER_NONE, PHONE_00,           N_A,              0,       UnusedPhoneScript,   0,       UnusedPhoneScript
	phone LASS,         DANA1,              ROUTE_20,         ANYTIME, DanaPhoneScript1,    ANYTIME, DanaPhoneScript2
	phone SCHOOLBOY,    CHAD1,              ROUTE_20,         ANYTIME, ChadPhoneScript1,    ANYTIME, ChadPhoneScript2
	phone POKEFANM,     DEREK1,             ROUTE_20,         ANYTIME, DerekPhoneScript1,   ANYTIME, DerekPhoneScript2
	phone FISHER,       TULLY1,             ROUTE_20,         ANYTIME, TullyPhoneScript1,   ANYTIME, TullyPhoneScript2
	phone POKEMANIAC,   BRENT1,             ROUTE_20,         ANYTIME, BrentPhoneScript1,   ANYTIME, BrentPhoneScript2
	phone PICNICKER,    TIFFANY3,           ROUTE_20,         ANYTIME, TiffanyPhoneScript1, ANYTIME, TiffanyPhoneScript2
	phone BIRD_KEEPER,  VANCE1,             ROUTE_20,         ANYTIME, VancePhoneScript1,   ANYTIME, VancePhoneScript2
	phone FISHER,       WILTON1,            ROUTE_20,         ANYTIME, WiltonPhoneScript1,  ANYTIME, WiltonPhoneScript2
	phone BLACKBELT_T,  KENJI3,             ROUTE_20,         ANYTIME, KenjiPhoneScript1,   ANYTIME, KenjiPhoneScript2
	phone HIKER,        PARRY1,             ROUTE_20,         ANYTIME, ParryPhoneScript1,   ANYTIME, ParryPhoneScript2
	phone PICNICKER,    ERIN1,              ROUTE_20,         ANYTIME, ErinPhoneScript1,    ANYTIME, ErinPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_BUENA, GOLDENROD_DEPT_STORE_ROOF, ANYTIME, BuenaPhoneScript1, ANYTIME, BuenaPhoneScript2
