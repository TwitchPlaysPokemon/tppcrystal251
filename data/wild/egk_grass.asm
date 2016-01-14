	map ROUTE_1_RB ;map is unchanged
	db $19 ;encounter rate, unchanged exept there's 1 for all day
	db 2 ;base level before variance (+0-4) and variance table
	dn 0, 0 ;most significant nyble is level variance table (tables not yet set), least significant is what % chance table to use.

		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA

		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA

		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA

	map ROUTE_2_RB
	db $19
	db 3
	dn 0, 0

		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db WEEDLE
		db RATTATA
		db WEEDLE
		db PIDGEY
		db WEEDLE
		db PIDGEY
		db WEEDLE
		db PIDGEY

		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db WEEDLE
		db RATTATA
		db WEEDLE
		db PIDGEY
		db WEEDLE
		db PIDGEY
		db WEEDLE
		db PIDGEY

		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db PIDGEY
		db RATTATA
		db WEEDLE
		db RATTATA
		db WEEDLE
		db PIDGEY
		db WEEDLE
		db PIDGEY
		db WEEDLE
		db PIDGEY

	map ROUTE_22_RB
	db $19
	db 2
	dn 0, 0

		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db SPEAROW
		db RATTATA
		db SPEAROW

		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db SPEAROW
		db RATTATA
		db SPEAROW

		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_M
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db NIDORAN_F
		db RATTATA
		db SPEAROW
		db RATTATA
		db SPEAROW

	db $ff ; end
