.data
	prompt:.asciz "\nInput quantity(Liters): "
	invalid:.asciz "Invalid input try again."
	message:.asciz "Number of makokopo (20L) is "
	remainder:.asciz "\nRemaining Liter quantity is "
	endl:.asciz "\n"
.text
.global _start
_start:
	# Print banner
	la a0, prompt
	li a7, 4
	ecall
	
	# Load input
	li a0, 0
	li a7, 5
	ecall
	
	# Move the value into temp address
	mv t0, a0
	bltz t0, Invalid
	
	# Set base unit of 20L per makokopo 
	li t1, 20
	
	# Do Division process
	div t2, t0, t1
	
	# Print message first
	la a0, message
	li a7, 4
	ecall
	
	# Print result as integer
	mv a0, t2
	li a7, 1
	ecall
	
	# To handle remainder
	mul t3, t2, t1
	sub t3, t0, t3
	
	# Print Remainder
	la a0, remainder
	li a7, 4
	ecall
	
	# Print reminder a double
	mv a0, t3
	li a7, 1
	ecall
	
	# End of main
	j Exit
	
Invalid:
	# Print Invalid prompt
	la a0, invalid
	li a7, 4
	ecall
	
	j Exit
	
Exit:
	# Endl Line
	la a0, endl
	li a7, 4
	ecall
	
	# End program
	li a7, 10
	ecall
