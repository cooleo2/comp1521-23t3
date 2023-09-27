
N_ELEMENTS = 5
main:

	# $t0: i
	# $t1: base address
	# $t2: offset
	# $t3: &array[i]
main_i_init:
    	li	$t0, 	0 	# i = 0; 
main_i_cond:
    	bge	$t0,	N_ELEMENTS, 	main_i_false # if (i >= N_ELEMENTS) goto main_i_false;

	la	$t1, 	array 	# get base address
	mul	$t2,	$t0,	4 	# get offset (1 word = 4 bytes)
	add	$t3,	$t1,	$t2	# base address + offset

	lw	$t4,	($t3)	# loading the value from memory

	li	$v0, 1		#putchar(array[i]);
	move	$a0, $t4
	syscall

    	li	$v0, 11		#printf("\n");
	li	$a0, '\n'
	syscall
main_i_step:
    	addi	$t0, 	$t0, 	1 # i++;
    	j 	main_i_cond
main_i_false:


	li	$v0, 0
	jr	$ra			# return 0;

	.data

array:
	.word	9999, 3333, 5555, 2222, 8888
