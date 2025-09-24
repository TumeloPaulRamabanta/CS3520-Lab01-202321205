.data
	prompt:.asciz "\nInput quantity(Litres): "
	invalid:.asciz "Invalid input, try again."
	message:.asciz "Number of makokopo (20L) is "
	remainder:.asciz "\nRemaining Litre quantity is "
	endl:.asciz "\n"
.text
.global _start
_start:
	
	la a0, prompt
	li a7, 4
	ecall
	

	li a0, 0
	li a7, 5
	ecall
	
	mv t0, a0
	bltz t0, Invalid
	
	li t1, 20
	
	div t2, t0, t1
	
	la a0, message
	li a7, 4
	ecall
	
	mv a0, t2
	li a7, 1
	ecall
	
	mul t3, t2, t1
	sub t3, t0, t3

	la a0, remainder
	li a7, 4
	ecall

	mv a0, t3
	li a7, 1
	ecall
	
	j Exit
	
Invalid:
	
	la a0, invalid
	li a7, 4
	ecall
	
	j Exit
	
Exit:
	
	la a0, endl
	li a7, 4
	ecall
	
	li a7, 10
	ecall
