#MATH for MIPS
.data
	INT1: .asciiz "Welcome to MATH for MIPS! What can I help you with?\n1. Sum or subtraction\n2. Multiplication\n3. Division\n4. Power\n5. Factorial\n"
	OPT:  .word 1,2,3,4,5
	STR1: .asciiz "Type two operands, separated by new line character:\n"
	STR2: .asciiz "The result is:\n"
	STR3: .asciiz "Type one operand:\n"
.text
.globl main
main:
	li $v0, 4
	la $a0, INT1
	syscall
	
	check_arg: li $v0, 5
		   syscall
		   slti $t0, $v0, 6
		   bne $t0, $0, end_check_args
		   j check_arg
	
	end_check_args:
	
	check_opt: la $t0, OPT
	           lw $t1, 0($t0)
	           beq $t1, $v0, sum_sub
	           lw $t1, 4($t0)
	           beq $t1, $v0, mult_
	           lw $t1, 8($t0)
	           beq $t1, $v0, div_
	           lw $t1, 12($t0)
	           beq $t1, $v0, power
	           lw $t1, 16($t0)
	           beq $t1, $v0, factorial
	
	sum_sub: li $v0, 4
		 la $a0, STR1
		 syscall
		 
		 li $v0, 5
		 syscall
		 add $t0, $0, $v0
		 
		 li $v0, 5
		 syscall
		 add $t1, $0, $v0
		 
		 li $v0, 4
		 la $a0, STR2
		 syscall
		 
		 add $a0, $t0, $t1
		 
		 li $v0, 1
		 syscall
		 j END

	mult_:    li $v0, 4
		 la $a0, STR1
		 syscall
		 
		 li $v0, 5
		 syscall
		 add $t0, $0, $v0
		 
		 li $v0, 5
		 syscall
		 add $t1, $0, $v0
		 
		 li $v0, 4
		 la $a0, STR2
		 syscall
		 
		 mul $a0, $t0, $t1
		 
		 li $v0, 1
		 syscall
		 j END

	 div_:    li $v0, 4
		 la $a0, STR1
		 syscall
		 
		 li $v0, 5
		 syscall
		 add $t0, $0, $v0
		 
		 li $v0, 5
		 syscall
		 add $t1, $0, $v0
		 
		 li $v0, 4
		 la $a0, STR2
		 syscall
		 
		 div $a0, $t0, $t1
		 
		 li $v0, 1
		 syscall
		 j END

	  power: li $v0, 4
	  	 la $a0, STR1
	  	 syscall
	  	 
	         li $v0, 5
		 syscall
		 add $t0, $0, $v0
		 
		 li $v0, 5
		 syscall
		 add $t1, $0, $v0
	  	 
	         li $t2, 0
	         li $t3, 1
	         cycle_power: slt $t4, $t2, $t1
	         	      beq $t4, $0, end_cycle_power
	         	      mul $t3, $t3, $t0
	         	      addiu $t2, $t2, 1
	         	      j cycle_power
	         end_cycle_power: li $v0, 4
	         la $a0, STR2
	         syscall
	         
	         li $v0, 1
	         addiu $a0, $t3, 0
	         syscall
	         
	         j END
      
      factorial: li $v0, 4
	  	 la $a0, STR3
	  	 syscall
	  	 
	         li $v0, 5
		 syscall
		 add $t0, $0, $v0
		 
		 
	  	 
	         li $t2, 1
	         li $t3, 1
	         factorial_power: slt $t4, $t2, $t0
	         	      beq $t4, $0, end_factorial_power
	         	      slti $t5, $t2, 2
	         	      bne $t5, $0, factorial_power1
	         	      mul $t3, $t3, $t2
	         	      factorial_power1: addiu $t2, $t2, 1
	         	      j factorial_power
	         end_factorial_power: li $v0, 4
	         la $a0, STR2
	         syscall
	         
	         li $v0, 1
	         addiu $a0, $t3, 0
	         syscall
	         
	         j END  
	END: li $v0, 10
	     syscall      
	         	           	           	           	           	           	           	           	           
	         	           	           	           	           	           	           	           	           	           	           	           	           
