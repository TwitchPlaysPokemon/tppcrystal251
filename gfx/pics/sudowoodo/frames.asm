	dw .frame1
	dw .frame2
	dw .frame3
.frame1
	db $00 ; bitmask
	db $03, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $2f
.frame2
	db $01 ; bitmask
	db $03, $24, $30, $31, $32, $33, $34, $35, $36, $37, $38
.frame3
	db $02 ; bitmask
	db $28, $2c
; 0xd8b8f
