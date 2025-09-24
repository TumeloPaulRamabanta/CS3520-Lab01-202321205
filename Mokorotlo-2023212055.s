.data
	prompt: .asciz "Input height(n): "
	invalid: .asciz "Invalid input try again"
	star: .asciz "*"
	endl: .ascii "\n"
	
.text
.globl _start
_start:
	la a0, prompt
	li a7, 4
	ecall
	
	li a0, 0	
	li a7, 5
	ecall
	
	mv t0, a0
	
	bltz t0, Invalid

	li t1, 0
	loop_1:
		
		addi t1, t1, 1
		
		bgt t1, t0, Exit
		
		la a0, endl
		li a7, 4
		ecall
		
		li t2, 0
		loop_2:
			addi t2, t2, 1
		
			bgt t2, t1, loop_1
			
			la a0, star
			li a7, 4
			ecall
			
			j loop_2
	j Exit

Invalid:
	la a0, invalid
	li a7, 4
	ecall
	j Exit
	
Exit:
	li a7, 10
	ecall
