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
	
	@R4=previousA  R5=previousB  R6=sum 

	SUBS R8,R0,#1	@update flags
	BLE .L3 	@ if input == 1, goto .L3 (which returns 1)
	
	MOV R4,#0	@previousA = 0
	MOV R5,#1	@previousB = 1

.Loop:
	ADD R6,R4,R5	@sum = previousA + previousB
	MOV R4,R5	@previousA = previousB
	MOV R5,R6	@previousB = sum
	SUBS R0,#1	@r0 - 1
	BGT .Loop	@if R0-1 (remain count) > 0, go to .loop

	MOV R0,R6
	pop {pc}

	

	@ END CODE MODIFICATION
.L3:
	mov r0, #1			@ R0 = 0
	pop {pc}	@ EPILOG


	.size fibonacci, .-fibonacci
	.end
