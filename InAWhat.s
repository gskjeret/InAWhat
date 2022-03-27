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

; These are magic bytes and can't be changed
	ifeq MakeExe
		printt "Building bootblock"
		dc.b	"DOS",0
		dc.l	0,$370
	endc

Startup:
; If we boot from bootblock clearing DMA channels is not required
	ifne MakeExe
		lea	CustomBase+6,a6
		move.w	#$7fff,DMACON-6(a6)
	endc
	
	add.w	#cop-BB_START,a4
	move.l	a4,$dff080
.Wait:	
; Wait? nah, let's just execute the copperlist and see what happens

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
; Almost the right color
	dc.w	$0180,$6Ff4;$0fc0

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