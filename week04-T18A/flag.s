N_COLS = 12
N_ROWS = 6

################################################################################
# .TEXT <main>
	.text
main:
	# Subset:   1
	#
	# Args:     void
	#
	# Returns:
	#    - $v0: int
	#
	# Frame:    [...]
	# Uses:     [...]
	# Clobbers: [...]
	#
	# Locals:
	#   - $t0: row
	#   - $t1: col
	#   - $t2: address of flag
	#
	# Structure:
	#   main
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]

main__prologue:
	# TODO: put your prologue for main here

main__body:


main__row_init:
	li	$t0,	0	# row = 0
main__row_cond:
	bge	$t0, 	N_ROWS, main__row_false

main__col_init:

	li	$t1,	0	# col = 0
main__col_cond:
	bge	$t1, 	N_COLS, main__col_false


	la	$t2, 	flag 	# base address
	# find offset :  (row * N_COLS + col) * sizeof(element)
	mul	$t4, 	$t0, 	N_COLS 	# row * N_COLS
	add	$t4, 	$t4,	$t1 	# (row * N_COLS + col)
	mul	$t4, 	$t4,	1	# (row * N_COLS + col) * sizeof(element)

	# add offset
	add	$t4, 	$t4, 	$t2

	lb	$a0,	($t4)
	li	$v0,	11
	syscall

main__col_step:
	addi	$t1, 	$t1, 	1
	j	main__col_cond
main__col_false:

	li	$a0,	'\n' # printing newline
	li	$v0,	11
	syscall

main__row_step:
	addi	$t0, 	$t0, 	1
	j 	main__row_cond
main__row_false:

main__epilogue:
	# TODO: put your epilogue for main here

	jr	$ra
	
	
	.data
flag:

        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.',
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#',
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'