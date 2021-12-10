#$t5 - used for the loop 
#$t6 = sum the result from collatz
#$a0 - param num 
#$s0 - counter members in the series 
Main:	addi $a0,$0,0 
	addi $t5,$0,100 #test: addi $t5,$0,10
	addi $s0,$0,0 # init to zero the counter of member in series 
For:	beq $a0,$t5, BreakEND # Loop range(0,100)
	addi $a0,$a0,1 # num = num + 1  
	jal Collatz # Collatz(num)
	add $t6,$t6,$v0 # counter of collatz
	j For #return to loop 
#end Loop 		
BreakEND:addi $v0,$0,1
	addi $a0,$t6,0
	syscall	# print number of serials have less than 50 member with initial nubmer between 1-100  
	addi $v0,$0,11
	addi $a0,$0,0x2c
	syscall	# print "," to I/0 
	addi $v0,$0,1
	addi $a0,$0,313288763
	syscall	# print my ID "ID" to I/0 
	j END_MAIN 
#collatz the function return 1 if counter members of collatz serial less than 51 else return 0:
# $s0 - counter members in the series 
# $a0 - param num 
#t0 - used to comparison to 1 
#$v0 - return  
Collatz:addi $sp,$sp,-12 
	sw $ra,0($sp)# store $ra in the stack 
	sw $a0,4($sp)#store $a0 in the stack 
	sw $s0,8($sp)#store $s0 in the stack (when return to main $s0 = 0 ) 
	addi $s0,$s0,1 #  $t4=$t4 + 1 - current nember of the series 
	addi $t0,$0,1 
	slti $t3,$s0,51 # if counter members in the series =< 50 #slti $t3,$s0,6 #test
	bne $t3,$0,num1 #if counter members less than 50  - > countiue else return 0 
	addi $v0,$0,0 # return 0
	j END  
num1:	bne $a0,$t0,odd # if num == 1 
	addi $v0,$0,1 # return 1  
	j END
odd:	andi $t1,$a0,1 # $t1 = last bite of num
	bne $t1,$t0, even #even or odd - $t1 = last bite of num ,$t0 = 1 if eq -> odd else even 
	addi $t1,$a0,1 # $t1 = num + 1 
	sll $a0,$a0,1 #num*2
	add $a0,$a0,$t1 # num*2 + (num + 1) = 3num -> $a0 = 3*num + 1 
	jal Collatz # call collatz(3*num + 1)
	j END
even: 	srl $a0,$a0,1 # num div 2 (num / 2)
	jal Collatz #call function Collatz(num/2)
	j END
END:	lw $ra,0($sp)#restore from stack
	lw $a0,4($sp)#restore from stack
	lw $s0,8($sp)#restore from stack
	addi $sp,$sp,12 # release the stack 
	jr $ra # return to where $ra pointing


END_MAIN:	

			
	
