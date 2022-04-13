BB_TARGET = 32

	include	customregs.S

BB_START
; These are magic bytes and must not be farked with 
	printt "Building bootblock"
	dc.b	"DOS",0
	dc.l	0

; This one isn't magic though. You might have seen it as $370 in some bootblock examples,
; but we don't need it to be that here since we have no exit. Let's abuse it!
; (Apparently it's the pointer to the root block, better known in decimal 880)
	dc.l	$dff080

Startup:
; When booting, a4 points to the start of the bootblock (BB_START), at least for the 
; relevant kickstart versions.
; Of course, sadly this technique will not work in an executable. Told you it was bad!
;
; This should be quite doable as a 64B executable though, if anyone's interested.

	movem.l	(a4)+,a0-a3 ; This will advance a4 to the start of the copperlist
	move.l	a4,(a2) ; a2 will contain $dff080

	nop
; NOP?!?!? WTF! What kind of sizecoding IS this, you say?
; The kind where I couldn't find anything more amusing to use the last bytes on!

; .Wait:	
	; bra	.Wait
; Wait? nah, we have no bytes for that. We just used the last ones on the NOP. 
; Let's just run the copperlist and see what happens.

cop:
	dc.w	$0180,$006c
	dc.W	$a809,$fffe

; Almost the right yellow here. It's supposed to be $fc0. Close enough for most people.
; Using the correct yellow would cause the CPU to branch too far
	dc.w	$0180,$6ff2
; Yes, I did say branch. And in your heart you begin to understand just how terrible this code is.
; Greetings to Photon!

	; dc.w	$ffff,$fffe 
; We omit the copwait, assuming that the RAM is zero filled
; In which case the copper will simply stop at the first instruction (trying to write to BLTDDAT, which is not writeable by the copper says the HW manual)
; It will restart at the next frame though.

; Yeah so my options at the end were
; 1. Have the correct yellow ($fc0) and use the bra.b .Wait
; 2. Try to reduce size to 30 bytes (with slightly wrong yellow). Well, that probably wouldn't work since
;    the copper wouldn't be at an integer number of longwords from the start. 
; 3. Have a nop in a 32 byte bootintro, and also get to use the $6ff2 branch trick,
;    still with slightly wrong yellow.
; 4. Switch to the russian flag instead
;
; OBVIOUSLY I chose option 3.
; After all, the most important job of this bootblock is to amuse ME.
;
; Interestingly, $6ff0 as yellow color works fine in WinUAE but causes flashing on real HW,
; I guess because we keep spamming the copper pointer (it branches to the move.l a4,(a2) instruction)

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