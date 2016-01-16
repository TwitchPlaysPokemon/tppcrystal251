; givetm TM_SANDSTORM, EVENT_GOT_TM_SANDSTORM
givetm: macro
	checkevent \2
	iftrue \3
	verbosegiveitem \1
	iffalse \4
	setevent \2
endm

; trainer event_Flag, class, trainer, seen_text, beaten_text, ?, after_script
trainer: macro
	dw \1
	db \2, \3
	dw \4, \5, \6, \7
endm
