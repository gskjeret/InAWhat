BB_TARGET = 32

; Set to 0 for running on real hardware
; DEBUG_DETAIL set 1

	ifnd MakeExe
MakeExe set 0
	endif

	ifge MakeExe
		printt "Building exe"
		section code, code_c
	endc

	include macros.S
	include	customregs.S

BB_START

	ifeq MakeExe
		printt "Building bootblock"
		dc.b	"DOS",0
		dc.l	0,$370
	endc

Startup:
; If we boot from bootblock clearing DMA channels is not required
	ifne MakeExe
	move.w	#$7fff,DMACON-6(a6)
	endc

	; lea	CustomBase+6,a6
	; lea	COLOR00-VHPOSR(a6),a5
	lea		cop(pc),a0
	move.l	a0,CustomBase+COP1LCH
	
	; moveq	#$6c,d0
	; moveq	#-64,d1 ; $ffc0
.Wait:	
; 	move.w	d0,(a5)
; .vbl1:	
; 	cmp.b	(a6),d0
; 	bne.s	.vbl1
; 	move.w	d1,(a5)
; .vbl2:	cmp.b	#45,(a6)
; 	bne.s	.vbl2
	bra	.Wait

cop:
	ifne MakeExe
	; Kill sprites if potentially coming from CLI or WB 
	dc.l	$01400000
	dc.l	$01420000
	dc.l	$01440000
	dc.l	$01460000
	endif

	; BPLCON0 can be skipped when bootblock
	; Can also be skipped for exe, because BPL DMA is turned off
	; dc.w	BPLCON0,$0200 

	dc.w	$0180,$006c
	dc.W	$a801,$fffe
	dc.w	$0180,$0fc0

	; dc.w	$ffff,$fffe ; Lulz

BB_END:
	ifeq MakeExe
BB_SIZE=	BB_END-BB_START
	if	BB_SIZE<=BB_TARGET
		printt ""
		printt "IT FITS! bytes used:"
		printv BB_SIZE
		; dcb.b	BB_TARGET-BB_SIZE,"x"
	else
		printt ""
		printt "IT IS TOO BIG! bytes to remove:"
		printv BB_TARGET-BB_SIZE
	endc
	endc
