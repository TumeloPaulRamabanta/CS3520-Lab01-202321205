.data
	prompt: .asciz "Input number of cattly: "
	invalid: .asciz "Invalid input try again."
	lacking: .asciz "Not Enough for Lobola."
	acceptable: .asciz "Small herd."
	wealthy: .asciz "Wealthy cattly owner"
	
.text
.globl _start
_start:
	# Saved ranges for rating
	li t1, 10
	li t2, 20
	
	# Print banner
	la a0, prompt
	li a7, 4
	ecall
	
	# Get input
	li a0, 0	# To avoid issues
	li a7, 5
	ecall
	
	# Move Input
	mv t0, a0
	
	# Invalid inout handling
	bltz t0, Invalid
	
	# Poor man
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
	# Print Invalid prompt
	la a0, invalid
	li a7, 4
	ecall
	j Exit
	
Exit:
	li a7, 10
	ecall
