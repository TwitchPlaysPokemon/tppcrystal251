	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame6
.frame1
	db $00 ; mouth open
	db $3d, $3b, $3e
.frame2
	db $00 ; mouth open alt eye
	db $3d, $3c, $3e
.frame3
	db $01 ; mouth open normal eye corr1
	db $31, $36, $3d, $39, $3b, $3e, $3a
.frame4
	db $02 ; mouth open alt eye corr2
	db $31, $34, $36, $3d, $39, $3c, $3e, $33, $37, $3a
.frame5
	db $03 ; mouth open normal eye corr3
	db $31, $34, $36, $38, $35, $3d, $39, $32, $3b, $3e, $33, $37, $3a
.frame6
	db $04 ; mouth closed alt eye corr1
	db $31, $36, $39, $3c, $3a