.data
	invalid: .asciz "Invalid input day, try again."
	prompt: .asciz "Input day of the week(1-7): "
	monday: .asciz "Mantaha"
	tuesday: .asciz "Labobeli"
	wednesday: .asciz "Laboraro"
	thursday: .asciz "Labone"
	friday: .asciz "Labohlano"
	satarday: .asciz "Moqebelo"
	sunday: .asciz "Sontaha"
	JumpTable:
		.word case_1
		.word case_2
		.word case_3
		.word case_4
		.word case_5
		.word case_6
		.word case_7
.text
.globl _start
_start:
	li t1, 7
	
	la a0, prompt
	li a7, 4
	ecall
	
	li a0, 0	
	li a7, 5
	ecall
	
	mv t0, a0

	blez t0, Invalid	
	bgt t0, t1, Invalid	
	
	addi t0, t0, -1	
	
	slli t1, t0, 2
	la t2, JumpTable
	add t1, t1, t2
	lw t1, 0(t1)
	jr t1
	
	j Exit

case_1:
	la a0, sunday
	j Print
case_2:
	la a0, monday
	j Print
case_3:
	la a0,tuesday
	j Print
case_4:
	la a0, wednesday
	j Print
case_5:
	la a0, thursday
	j Print
case_6:
	la a0, friday
	j Print
case_7:
	la a0, satarday
	j Print
	
Print:
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
