	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	MOV R3, #10
	LDR R0,= SRC + (size-1)*4
	LDR R1,= SRC+ (size-1)*4 + shift*4
BACK	LDR R2, [R0], #-4
	STR R2, [R1], #-4
	SUB R3, #1
	CMP R3, #0
	BNE BACK
STOP B STOP
size equ 10
shift equ 2
	AREA mydata,DATA,READWRITE
SRC DCD 0x11,0x21,0x31,0x41,0x51,0x61,0x71,0x81,0x91,0xA1
	END