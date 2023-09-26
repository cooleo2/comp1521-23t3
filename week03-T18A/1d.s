N_ELEMENTS = 5
main:

	# $t0: 0

main_i_init:
    li	$t0, 0
main_i_cond:
    bge $t0, N_ELEMENTS, main_i_false
main_i_body:
    la  $t1, array	# base address
    mul $t2, $t0, 4	# offset
    add	$t1, $t2, $t1   # base address + offset

    # $t1 has the address of the element array[i]
    lw $t3, ($t1)

    li $v0, 1		# print $t3
    move $a0, $t3
    syscall

    li $v0, 11		# print newline
    li $a0, '\n'
    syscall

main_i_step:
    addi $t0, $t0, 1
    j main_i_cond;
main_i_false:


	li	$v0, 0
	jr	$ra			# return 0;

	.data

array:
	.word	9999, 6666, 44444, 3333, 2222
