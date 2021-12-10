.data
	str1:.asciiz"412$7"
.text
# $t0 = address of first char ascii string 
ascii: 	addi $t0,$t0,0x1001 # $t0 = 0x1001
	sll $t0,$t0, 16 # $t0 = address of ascii string
For:	 lb $t1,0($t0) # The current char address i'm checking (i + pointer address) 
	 addi $t0,$t0,1 # load bite(char in index i (in asscii))
	slti $t2,$t1,0x40 # if $t1 < 0x40 
	addi $t3,$0,0x30  
	slt $t3,$t3,$t1 # if 0x30 < $t1
	bne $t3,$t2, END # if not 0x30 < $t1 <0x40 (ascii digit) jump to END
	mul $v0,$v0,10 # 
	addi $t1,$t1,-0x30 # convert to digit number from ascii (ascii -0x30)
	add $v0,$v0,$t1 # $v0 += $t1 
	j For
END: 	 

	
