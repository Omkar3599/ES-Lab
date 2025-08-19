	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler      
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R0, =BCD_INPUT     
	LDR R1, [R0]            

	MOV R2, R1, LSR #4      
	AND R3, R1, #0xF        
	
	LSL R4, R2, #3          
	ADD R4, R4, R2, LSL #1  	
	ADD R4, R4, R3          
	LDR R0, =HEX_RESULT
	STR R4, [R0]

STOP B STOP

BCD_INPUT DCD 0x15 
	AREA data, DATA, READWRITE
HEX_RESULT DCD 0
	END