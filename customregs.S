BLTDDAT equ $000 ; Blitter destination early read
                 ;     (dummy address)
DMACONR equ $002 ; DMA control (and blitter status) read
VPOSR   equ $004 ; Read vert most signif. bit (and frame flop)
VHPOSR  equ $006 ; Read vert and horiz. position of beam
DSKDATR equ $008 ; Disk data early read (dummy address)
JOY0DAT equ $00A ; Joystick-mouse 0 data (vert,horiz)
JOY1DAT equ $00C ; Joystick-mouse 1 data (vert,horiz)
CLXDAT  equ $00E ; Collision data register (read and clear)
ADKCONR equ $010 ; Audio, disk control register read
POT0DAT equ $012 ; Pot counter pair 0 data (vert,horiz)
POT1DAT equ $014 ; Pot counter pair 1 data (vert,horiz)
POTGOR  equ $016 ; Pot port data read (formerly POTINP)
SERDATR equ $018 ; Serial port data and status read
DSKBYTR equ $01A ; Disk data byte and status read
INTENAR equ $01C ; Interrupt enable bits read
INTREQR equ $01E ; Interrupt request bits read
DSKPTH  equ $020 ; Disk pointer (high 3 bits, 5 bits if ECS)
DSKPTL  equ $022 ; Disk pointer (low 15 bits)
DSKLEN  equ $024 ; Disk length
DSKDAT  equ $026 ; Disk DMA data write
REFPTR  equ $028 ; Refresh pointer
VPOSW   equ $02A ; Write vert most signif. bit (and frame flop)
VHPOSW  equ $02C ; Write vert and horiz position of beam
COPCON  equ $02E ; Coprocessor control register (CDANG)
SERDAT  equ $030 ; Serial port data and stop bits write
SERPER  equ $032 ; Serial port period and control
POTGO   equ $034 ; Pot port data write and start
JOYTEST equ $036 ; Write to all four joystick-mouse counters
                 ; at once
STREQU  equ $038 ; Strobe for horiz sync with VB and EQU
STRVBL  equ $03A ; Strobe for horiz sync with VB (vert. blank)
STRHOR  equ $03C ; Strobe for horiz sync
STRLONG equ $03E ; Strobe for identification of long
                 ;     horiz. line.
BLTCON0 equ $040 ; Blitter control register 0
BLTCON1 equ $042 ; Blitter control register 1
BLTAFWM equ $044 ; Blitter first word mask for source A
BLTALWM equ $046 ; Blitter last word mask for source A
BLTCPTH equ $048 ; Blitter pointer to source C (high 3 bits)
BLTCPTL equ $04A ; Blitter pointer to source C (low 15 bits)
BLTBPTH equ $04C ; Blitter pointer to source B (high 3 bits)
BLTBPTL equ $04E ; Blitter pointer to source B (low 15 bits)
BLTAPTH equ $050 ; Blitter pointer to source A (high 3 bits)
BLTAPTL equ $052 ; Blitter pointer to source A (low 15 bits)
BLTDPTH equ $054 ; Blitter pointer to destination D
                 ;     (high 3 bits)
BLTDPTL equ $056 ; Blitter pointer to destination D
                 ;     (low 15 bits)
BLTSIZE equ $058 ; Blitter start and size (window width,height)
BLTCON0L equ $05A ; Blitter control 0, lower 8 bits (minterms)
BLTSIZV equ $05C ; Blitter V size (for 15 bit vertical size)
BLTSIZH equ $05E ; Blitter H size and start (for 11 bit H size)
BLTCMOD equ $060 ; Blitter modulo for source C
BLTBMOD equ $062 ; Blitter modulo for source B
BLTAMOD equ $064 ; Blitter modulo for source A
BLTDMOD equ $066 ; Blitter modulo for destination D
        ; equ $068 ; $06A ; $06C ; $06E ; 
BLTCDAT equ $070 ; Blitter source C data register
BLTBDAT equ $072 ; Blitter source B data register
BLTADAT equ $074 ; Blitter source A data register
        ; equ $076 ; 
SPRHDAT equ $078 ; Ext. logic UHRES sprite pointer and data id
        ; equ $07A ; 
DENISEID equ $07C ; Chip revision level for Denise
                 ;     (video out chip)
DSKSYNC equ $07E ; Disk sync pattern register for disk read
COP1LCH equ $080 ; Coprocessor first location register
                 ;    (high 3 bits, high 5 bits if ECS)
COP1LCL equ $082 ; Coprocessor first location register
                 ;    (low 15 bits)
COP2LCH equ $084 ; Coprocessor second location register
                 ;    (high 3 bits, high 5 bits if ECS)
COP2LCL equ $086 ; Coprocessor second location register
                 ;    (low 15 bits)
COPJMP1 equ $088 ; Coprocessor restart at first location
COPJMP2 equ $08A ; Coprocessor restart at second location
COPINS  equ $08C ; Coprocessor instruction fetch identify
DIWSTRT equ $08E ; Display window start (upper left
                 ;    vert-horiz position)
DIWSTOP equ $090 ; Display window stop (lower right
                 ;    vert.-horiz. position)
DDFSTRT equ $092 ; Display bitplane data fetch start
                 ;    (horiz. position)
DDFSTOP equ $094 ; Display bitplane data fetch stop
                 ;    (horiz. position)
DMACON  equ $096 ; DMA control write (clear or set)
CLXCON  equ $098 ; Collision control
INTENA  equ $09A ; Interrupt enable bits (clear or
                 ;    set bits)
INTREQ  equ $09C ; Interrupt request bits (clear or
                 ;    set bits)
ADKCON  equ $09E ; Audio, disk, UART control
AUD0LCH equ $0A0 ; Audio channel 0 location (high 3 bits,
                 ;     5 if ECS)
AUD0LCL equ $0A2 ; Audio channel 0 location (low 15 bits)
AUD0LEN equ $0A4 ; Audio channel 0 length
AUD0PER equ $0A6 ; Audio channel 0 period
AUD0VOL equ $0A8 ; Audio channel 0 volume
AUD0DAT equ $0AA ; Audio channel 0 data
        ; equ $0AC ; $0AE ; 
AUD1LCH equ $0B0 ; Audio channel 1 location (high 3 bits)
AUD1LCL equ $0B2 ; Audio channel 1 location (low 15 bits)
AUD1LEN equ $0B4 ; Audio channel 1 length
AUD1PER equ $0B6 ; Audio channel 1 period
AUD1VOL equ $0B8 ; Audio channel 1 volume
AUD1DAT equ $0BA ; Audio channel 1 data
        ; equ $0BC ; $0BE ; 
AUD2LCH equ $0C0 ; Audio channel 2 location (high 3 bits)
AUD2LCL equ $0C2 ; Audio channel 2 location (low 15 bits)
AUD2LEN equ $0C4 ; Audio channel 2 length
AUD2PER equ $0C6 ; Audio channel 2 period
AUD2VOL equ $0C8 ; Audio channel 2 volume
AUD2DAT equ $0CA ; Audio channel 2 data
        ; equ $0CC ; $0CE ; 
AUD3LCH equ $0D0 ; Audio channel 3 location (high 3 bits)
AUD3LCL equ $0D2 ; Audio channel 3 location (low 15 bits)
AUD3LEN equ $0D4 ; Audio channel 3 length
AUD3PER equ $0D6 ; Audio channel 3 period
AUD3VOL equ $0D8 ; Audio channel 3 volume
AUD3DAT equ $0DA ; Audio channel 3 data
        ; equ $0DC ; $0DE ; 
BPL1PTH equ $0E0 ; Bitplane 1 pointer (high 3 bits)
BPL1PTL equ $0E2 ; Bitplane 1 pointer (low 15 bits)
BPL2PTH equ $0E4 ; Bitplane 2 pointer (high 3 bits)
BPL2PTL equ $0E6 ; Bitplane 2 pointer (low 15 bits)
BPL3PTH equ $0E8 ; Bitplane 3 pointer (high 3 bits)
BPL3PTL equ $0EA ; Bitplane 3 pointer (low 15 bits)
BPL4PTH equ $0EC ; Bitplane 4 pointer (high 3 bits)
BPL4PTL equ $0EE ; Bitplane 4 pointer (low 15 bits)
BPL5PTH equ $0F0 ; Bitplane 5 pointer (high 3 bits)
BPL5PTL equ $0F2 ; Bitplane 5 pointer (low 15 bits)
BPL6PTH equ $0F4 ; Bitplane 6 pointer (high 3 bits)
BPL6PTL equ $0F6 ; Bitplane 6 pointer (low 15 bits)
        ; equ $0F8 ; $0FA ; $0FC ; $0FE ; 
BPLCON0 equ $100 ; Bitplane control register
                 ;     (misc. control bits)
BPLCON1 equ $102 ; Bitplane control reg.
                 ;     (scroll value PF1, PF2)
BPLCON2 equ $104 ; Bitplane control reg. (priority control)
BPLCON3 equ $106 ; Bitplane control (enhanced features)
BPL1MOD equ $108 ; Bitplane modulo (odd planes)
BPL2MOD equ $10A ; Bitplane modulo (even planes)
        ; equ $10C ; $10E ; 
BPL1DAT equ $110 ; Bitplane 1 data (parallel-to-serial convert)
BPL2DAT equ $112 ; Bitplane 2 data (parallel-to-serial convert)
BPL3DAT equ $114 ; Bitplane 3 data (parallel-to-serial convert)
BPL4DAT equ $116 ; Bitplane 4 data (parallel-to-serial convert)
BPL5DAT equ $118 ; Bitplane 5 data (parallel-to-serial convert)
BPL6DAT equ $11A ; Bitplane 6 data (parallel-to-serial convert)
        ; equ $11C ; $11E ; 
SPR0PTH equ $120 ; Sprite 0 pointer (high 3 bits)
SPR0PTL equ $122 ; Sprite 0 pointer (low 15 bits)
SPR1PTH equ $124 ; Sprite 1 pointer (high 3 bits)
SPR1PTL equ $126 ; Sprite 1 pointer (low 15 bits)
SPR2PTH equ $128 ; Sprite 2 pointer (high 3 bits)
SPR2PTL equ $12A ; Sprite 2 pointer (low 15 bits)
SPR3PTH equ $12C ; Sprite 3 pointer (high 3 bits)
SPR3PTL equ $12E ; Sprite 3 pointer (low 15 bits)
SPR4PTH equ $130 ; Sprite 4 pointer (high 3 bits)
SPR4PTL equ $132 ; Sprite 4 pointer (low 15 bits)
SPR5PTH equ $134 ; Sprite 5 pointer (high 3 bits)
SPR5PTL equ $136 ; Sprite 5 pointer (low 15 bits)
SPR6PTH equ $138 ; Sprite 6 pointer (high 3 bits)
SPR6PTL equ $13A ; Sprite 6 pointer (low 15 bits)
SPR7PTH equ $13C ; Sprite 7 pointer (high 3 bits)
SPR7PTL equ $13E ; Sprite 7 pointer (low 15 bits)
SPR0POS equ $140 ; Sprite 0 vert-horiz start position
                 ;    data
SPR0CTL equ $142 ; Sprite 0 vert stop position and
                 ;    control data
SPR0DATA equ $144 ; Sprite 0 image data register A
SPR0DATB equ $146 ; Sprite 0 image data register B
SPR1POS equ $148 ; Sprite 1 vert-horiz start position
                 ;    data
SPR1CTL equ $14A ; Sprite 1 vert stop position and
                 ;    control data
SPR1DATA equ $14C ; Sprite 1 image data register A
SPR1DATB equ $14E ; Sprite 1 image data register B
SPR2POS equ $150 ; Sprite 2 vert-horiz start position
                 ;    data
SPR2CTL equ $152 ; Sprite 2 vert stop position and
                 ;    control data
SPR2DATA equ $154 ; Sprite 2 image data register A
SPR2DATB equ $156 ; Sprite 2 image data register B
SPR3POS equ $158 ; Sprite 3 vert-horiz start position
                 ;    data
SPR3CTL equ $15A ; Sprite 3 vert stop position and
                 ;    control data
SPR3DATA equ $15C ; Sprite 3 image data register A
SPR3DATB equ $15E ; Sprite 3 image data register B
SPR4POS equ $160 ; Sprite 4 vert-horiz start position
                 ;    data
SPR4CTL equ $162 ; Sprite 4 vert stop position and
                 ;    control data
SPR4DATA equ $164 ; Sprite 4 image data register A
SPR4DATB equ $166 ; Sprite 4 image data register B
SPR5POS equ $168 ; Sprite 5 vert-horiz start position
                 ;    data
SPR5CTL equ $16A ; Sprite 5 vert stop position and
                 ;    control data
SPR5DATA equ $16C ; Sprite 5 image data register A
SPR5DATB equ $16E ; Sprite 5 image data register B
SPR6POS equ $170 ; Sprite 6 vert-horiz start position
                 ;    data
SPR6CTL equ $172 ; Sprite 6 vert stop position and
                 ;    control data
SPR6DATA equ $174 ; Sprite 6 image data register A
SPR6DATB equ $176 ; Sprite 6 image data register B
SPR7POS equ $178 ; Sprite 7 vert-horiz start position
                 ;    data
SPR7CTL equ $17A ; Sprite 7 vert stop position and
                 ;    control data
SPR7DATA equ $17C ; Sprite 7 image data register A
SPR7DATB equ $17E ; Sprite 7 image data register B
COLOR00 equ $180 ; Color table 00
COLOR01 equ $182 ; Color table 01
COLOR02 equ $184 ; Color table 02
COLOR03 equ $186 ; Color table 03
COLOR04 equ $188 ; Color table 04
COLOR05 equ $18A ; Color table 05
COLOR06 equ $18C ; Color table 06
COLOR07 equ $18E ; Color table 07
COLOR08 equ $190 ; Color table 08
COLOR09 equ $192 ; Color table 09
COLOR10 equ $194 ; Color table 10
COLOR11 equ $196 ; Color table 11
COLOR12 equ $198 ; Color table 12
COLOR13 equ $19A ; Color table 13
COLOR14 equ $19C ; Color table 14
COLOR15 equ $19E ; Color table 15
COLOR16 equ $1A0 ; Color table 16
COLOR17 equ $1A2 ; Color table 17
COLOR18 equ $1A4 ; Color table 18
COLOR19 equ $1A6 ; Color table 19
COLOR20 equ $1A8 ; Color table 20
COLOR21 equ $1AA ; Color table 21
COLOR22 equ $1AC ; Color table 22
COLOR23 equ $1AE ; Color table 23
COLOR24 equ $1B0 ; Color table 24
COLOR25 equ $1B2 ; Color table 25
COLOR26 equ $1B4 ; Color table 26
COLOR27 equ $1B6 ; Color table 27
COLOR28 equ $1B8 ; Color table 28
COLOR29 equ $1BA ; Color table 29
COLOR30 equ $1BC ; Color table 30
COLOR31 equ $1BE ; Color table 31

HTOTAL  equ $1C0 ; Highest number count, horiz line
                 ;     (VARBEAMEN=1)
HSSTOP  equ $1C2 ; Horizontal line position for HSYNC stop
HBSTRT  equ $1C4 ; Horizontal line position for HBLANK start
HBSTOP  equ $1C6 ; Horizontal line position for HBLANK stop
VTOTAL  equ $1C8 ; Highest numbered vertical line
                 ;     (VARBEAMEN=1)
VSSTOP  equ $1CA ; Vertical line position for VSYNC stop
VBSTRT  equ $1CC ; Vertical line for VBLANK start
VBSTOP  equ $1CE ; Vertical line for VBLANK stop

        ; equ $1D0 ; Reserved
        ; equ $1D2 ; Reserved
        ; equ $1D4 ; Reserved
        ; equ $1D6 ; Reserved
        ; equ $1D8 ; Reserved
        ; equ $1DA ; Reserved

BEAMCON equ $1DC ; Beam counter control register (SHRES,PAL)
HSSTRT  equ $1DE ; Horizontal sync start (VARHSY)
VSSTRT  equ $1E0 ; Vertical sync start   (VARVSY)
HCENTER equ $1E2 ; Horizontal position for Vsync on interlace
DIWHIGH equ $1E4 ; Display window -  upper bits for start, stop

CustomBase = $dff000