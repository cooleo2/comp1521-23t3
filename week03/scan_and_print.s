main:
        
        # TODO: create loop for scanning
main_i_init:
    	li	$t0, 0
main_i_cond:
    	bge 	$t0, 10, main_i_false
main_i_body:
	la	$t1, 	numbers 	# get base address
	mul	$t2,	$t0,	4 	# get offset (1 word = 4 bytes)
	add	$t3,	$t1,	$t2	# base address + offset
	# $t3: &numbers[i]

	li	$v0, 	5
	syscall
	move	$t4,	$v0	# $t4 contains the number

	sw	$t4, 	($t3)	# store into memory


main_i_step:
    	addi $t0, $t0, 1
    	j main_i_cond;
main_i_false:
        
main_i_print_init:
    	li	$t0, 0
main_i_print_cond:
    	bge $t0, 10, main_i_print_false
main_i_print_body:
	la	$t1, 	numbers 	# get base address
	mul	$t2,	$t0,	4 	# get offset (1 word = 4 bytes)
	add	$t3,	$t1,	$t2	# base address + offset
	# $t3: &numbers[i]

	lw	$t4, 	($t3)	# load from memory

	li	$v0, 	1
	move	$a0,	$t4	# $t4 contains the number, we are printing it
	syscall
	
	li	$v0, 	11
	li	$a0,	'\n'	# print newline
	syscall

	

main_i_print_step:
    	addi $t0, $t0, 1
    	j main_i_print_cond;
main_i_print_false:

	li	$v0, 0
	jr	$ra			# return 0;
        

        .data
numbers:
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
