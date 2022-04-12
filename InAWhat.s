BB_TARGET = 32

	include	customregs.S

BB_START
; These are magic bytes and must not be farked with 
	printt "Building bootblock"
	dc.b	"DOS",0
	dc.l	0,$370

Startup:
; When booting, a4 points to the start of the bootblock (BB_START)
; We tried many ways of increasing a4 by 12 or more, since the copper would choke on the 370 longword.
; Unfortunately we did not find a method that took less than 4 bytes. And nobody loves a 34 byte intro.
; So this was the best we could do. The magic number will vary by kickstart (how much chipmem will libraries etc take)
; and by whether there's fastmem available (some data will get put there instead of in chipmem).
; No other variables should affect it. Of course, sadly this will not work in an executable. Or on any other combination
; of kickstart and fastmem being available/unavailable than it's designed for. Told you it was bad!
;
; This should be quite doable as a 64B executable though, if anyone's interested.

MAGIC_COPADDR = $156c ; Kick 1.2/1.3, fastmem exists
; MAGIC_COPADDR = $5c54 ; Kick 1.3, no fastmem
; MAGIC_COPADDR = $5b9c ; Kick 1.2, no fastmem
; MAGIC_COPADDR = $3a74 ; AROS Kick, fastmem exists (AROS version from WinUAE 4.9.0)
; MAGIC_COPADDR = $4bf4 ; AROS Kick, no fastmem (AROS version from WinUAE 4.9.0)
; Didn't seem to work on Kick 3.1, and then I got bored. Feel free to do a PR if you want more 
; kickstarts for whatever reason

	move.w	#MAGIC_COPADDR,CustomBase+COP1LCL

; .Wait:	
	; bra	.Wait
; Wait? nah, we have no bytes for that. Let's just run the copperlist and see what happens

cop:

	dc.w	$0180,$006c
	dc.W	$a809,$fffe
; Almost the right color. It's supposed to be $fc0. Close enough for most people.
; Using the correct yellow would cause the CPU to branch just a bit too far
	dc.w	$0180,$6ff4
; Yes, I did say branch. And in your heart you begin to understand just how terrible this code is.
; Greetings to Photon!

	; dc.w	$ffff,$fffe 
; We omit the copwait, assuming that the RAM is zero filled
; In which case the copper will halt at the first instruction
; It will restart at the next frame though

BB_END:
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