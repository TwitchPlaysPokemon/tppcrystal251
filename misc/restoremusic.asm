SECTION "restoremusic", ROMX

SaveMusic::
	; back up old music state
	push hl
	push de
	push bc
	push af

	ld bc, wMapMusic - MusicPlaying
	ld hl, MusicPlaying
	ld de, SoundEngineBackup
	ld a, $4
	di
	ld [rSVBK], a
	ld a, [SoundEngineBackup]
	and a
	jr nz, .skip
	call CopyBytes
.skip
	ld a, $1
	ld [rSVBK], a
	ei

	pop af
	pop bc
	pop de
	pop hl
	ret

RestoreMusic::
	push hl
	push de
	push bc
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	
	ld bc, wMapMusic - MusicPlaying
	ld de, MusicPlaying
	ld hl, SoundEngineBackup
	ld a, $4
	di
	ld [rSVBK], a
	ld a, [hl]
	and a
	jr nz, .copy
	call .done
	call PlayMapMusic
	ret

.copy
	call CopyBytes
	xor a
	ld [SoundEngineBackup], a
	
.done
	ld a, $1
	ld [rSVBK], a
	ei
	
	pop af
	pop bc
	pop de
	pop hl
	ret

InitializeMusic::
	ld a, [rSVBK]
	push af

	ld a, $4
	ld [rSVBK], a
	xor a
	ld [SoundEngineBackup], a

	pop af
	ld [rSVBK], a
	ret

DeleteSavedMusic::
	push af
	ld a, $4
	di
	ld [rSVBK], a
	xor a
	ld [SoundEngineBackup], a
	ld a, $1
	ld [rSVBK], a
	ei
	pop af
	ret
