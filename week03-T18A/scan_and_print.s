main:
        
        # TODO: create loop for scanning
main_i_init:
    	li	$t0, 0
main_i_cond:
    	bge $t0, 10, main_i_false
main_i_body:
    	la  	$t1, numbers	# base address
    	mul 	$t2, $t0, 4	# offset
    	add	$t1, $t2, $t1   # base address + offset

    	# $t1 has the address of the element numbers[i]
    	li 	$v0, 5		# scan integer
    	syscall
	move	$t3, $v0 	# scanned in integer

	sw	$t3, ($t1)

main_i_step:
    	addi $t0, $t0, 1
    	j main_i_cond;
main_i_false:
        
main_i_print_init:
    	li	$t0, 0
main_i_print_cond:
    	bge $t0, 10, main_i_false
main_i_print_body:
    	la  	$t1, numbers	# base address
    	mul 	$t2, $t0, 4	# offset
    	add	$t1, $t2, $t1   # base address + offset

    	# $t1 has the address of the element numbers[i]
    	li 	$v0, 1		# print integer
	lw	$a0, ($t1)
    	syscall

	li $v0, 11		# print newline
    	li $a0, '\n'
    	syscall

main_i_print_step:
    	addi $t0, $t0, 1
    	j main_i_cond;
main_i_print_false:

	li	$v0, 0
	jr	$ra			# return 0;
        

        .data
numbers:
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
