IntroBoot_00: db "CPU<COLON> Sharp LR35902#     <AT> 4.19Mhz@"
IntroBoot_01: db "CPU<COLON> Ricoh 5A22#     <AT> 3.58Mhz@"
IntroBoot_02: db "CPU<COLON> Sharp LR35902#     <AT> 8.38Mhz@"
IntroBoot_03: db "CPU<COLON> ARM7TDMI#     <AT> 16.8Mhz@"
IntroBoot_04: db "Memory<COLON> @"
IntroBoot_05: db "Int. Mem.<COLON>@"
IntroBoot_06: db "Ext. Mem.<COLON>@"
IntroBoot_07: db "#login<COLON> @"
IntroBoot_08: db "password<COLON> @"
IntroBoot_09: db "#<GT> @"
IntroBoot_10: db "GB program detected#Using SGB<...>@"
IntroBoot_11: db "GBC program detected#Using compat mode<...>@"
IntroBoot_12: db "Starting TPPCRYSTAL<...>@"
IntroBoot_13: db "ERROR: Incompatible#hardware! Displaying#gbc_only handler<...>@"

IntroBoot_GB:
	dw IntroBoot_00, IntroBoot_04, IntroBoot_07, IntroBoot_08, IntroBoot_09, IntroBoot_12, IntroBoot_13
	
IntroBoot_SGB:
	dw IntroBoot_01, IntroBoot_04, IntroBoot_07, IntroBoot_08, IntroBoot_09, IntroBoot_10, IntroBoot_12, IntroBoot_13
	
IntroBoot_GBC:
	dw IntroBoot_02, IntroBoot_04, IntroBoot_07, IntroBoot_08, IntroBoot_09, IntroBoot_12
	
IntroBoot_GBA:
	dw IntroBoot_03, IntroBoot_05, IntroBoot_06, IntroBoot_07, IntroBoot_08, IntroBoot_09, IntroBoot_11, IntroBoot_12
	
Typeout_tpp:
	db "tpp@"
	
Typeout_c251:
	db "c251"
IF !DEF(PUBLIC_RELEASE)
	db " -s"
ENDC
IF DEF(BEESAFREE)
	db " -b"
ENDC
	db "@"
	
Memtest_GB:
	db 0, 1, 2, 3, 4, 5, 6, 7, 8
	
Memtest_SGB:
	db 0, 10, 14, 15, 16, 17, 18, 19, 20
	
Memtest_GBC:
	db 0, 4, 8, 9, 10, 11, 12, 13, 14
	
Memtest_GBA:
	db 0, 14, 16, 18, 20, 21, 22, 23, 24
	
MemtestStrings:
	db "0@"
	db "1024@"
	db "2048@"
	db "3072@"
	db "4096@"
	db "5120@"
	db "6144@"
	db "7168@"
	db "8192@"
	db "12288@"
	db "16384@"
	db "20480@"
	db "24576@"
	db "28672@"
	db "32768@"
	db "49152@"
	db "65536@"
	db "81920@"
	db "98304@"
	db "114688@"
	db "131072@"
	db "163840@"
	db "196608@"
	db "229376@"
	db "262144@"
	
Memtest_OK:
	db "OK@"