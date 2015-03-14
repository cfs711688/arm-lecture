	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {lr}
	
	@R4=previousA  R5=previousB  R6=sum  R7=i  R8=x

	ADDS R8,R0,#0	@update flags
	BLE .L3 	@ if input <= 0, goto .L3 (which returns 0)
	
	MOV R4,#0	@previousA = -1
	MOV R5,#1	@previousB = 1
	MOV R7,#1	@i = 1

.Loop:
	ADD R6,R4,R5	@sum = previousA + previousB
	MOV R4,R5	@previousA = previousB
	MOV R5,R6	@previousB = sum
	ADD R7,#1	@i++
	CMP R8,R7
	BGT .Loop	@if i<= x, go to .loop

	MOV R0,R6
	pop {pc}

	

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {pc}	@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {pc}	@ EPILOG

	.size fibonacci, .-fibonacci
	.end
