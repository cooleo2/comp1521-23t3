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
	#   - $t2: base address
	#   - $t3: row offset
	#
	# Structure:
	#   main
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]

main__prologue:
	# TODO: put your prologue for main here

main__body:

main_row_init:
	li	$t0,	0	# row = 0;
main_row_cond:
	bge	$t0,	N_ROWS,	main_row_false 	# if (row >= 6) goto main_row_false;
main_col_init:
	li	$t1,	0	# col = 0;
main_col_cond:
	bge	$t1,	N_COLS, main_col_false 	# if (col >= 12) goto main_col_false;
    

	# Calculate Offset
	# Calculate Row Offset
	#		row	size of each row
	mul	$t3,	$t0,	N_COLS
	#	    row offset	size of each element
	mul	$t3,	$t3,	1
	# Calculate Column Offset
	#		column	size of each element
	mul	$t4,	$t1,	1

	# Add all three together
	add	$t5,	$t3,	$t4

	lb	$a0,	flag($t5)	# printf("%c", flag[row][col]);
	li	$v0,	11
	syscall
    	
main_col_step:
    	addi	$t1, 	1 # col++;
    	j 	main_col_cond;
main_col_false:
    	li	$a0,	'\n' # printf("\n");
	li	$v0,	11
	syscall

main_row_step:
    	addi	$t0, 	1 # row++;
    	j 	main_row_cond;
main_row_false:



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