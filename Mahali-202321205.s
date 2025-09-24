.data
	prompt: .asciz "Input number of cattle : "
	invalid: .asciz "Invalid input, try again."
	lacking: .asciz "Not Enough for Lobola."
	acceptable: .asciz "Small herd."
	wealthy: .asciz "Wealthy cattle owner"
	
.text
.globl _start
_start:
	li t1, 10
	li t2, 20
	
	la a0, prompt
	li a7, 4
	ecall

	li a0, 0
	li a7, 5
	ecall
	
	mv t0, a0
	
	bltz t0, Invalid
	
	blt t0, t1, Lacking
	blt t0, t2, Acceptable
	
	la a0, wealthy
	li a7, 4
	ecall
	
	j Exit
	
Acceptable:
	la a0, acceptable
	li a7, 4
	ecall
	j Exit
	
Lacking:
	la a0, lacking
	li a7, 4
	ecall
	j Exit
	
Invalid:
	la a0, invalid
	li a7, 4
	ecall
	j Exit
	
Exit:
	li a7, 10
	ecall
