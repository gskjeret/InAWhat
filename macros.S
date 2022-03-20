UAEExitWarp     MACRO
        pea     1.w
        pea     .ob\@(pc)
        clr.l   -(sp)
        pea     .wm\@(pc)
        pea     -1.w
        pea     82.w
        jsr     $f0ff60
        lea     .bc\@(pc),a0
        move.l  a0,8(sp)
        jsr     $f0ff60
        lea     6*4(sp),sp
        bra.s   .s\@
.ob\@   dc.l    0
.wm\@   dc.b    "warp false",0
.bc\@   dc.b    "cycle_exact true",0
        cnop    0,2
.s\@
        ENDM

BREAKPOINT:macro
		clr.w	$100
	endm

WinUAEBreakpoint:macro
														;to stop here in WinUAE, enter "w 4 4 4 w" in the debugger window (shift+f12) to place the breakpoint, and enter "w 4" to remove it
		move.l	4.w,4.w
	endm
