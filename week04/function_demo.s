
################################################################################
# .TEXT <main>
	.text
main:
main__prologue:					
	begin					
	push	$ra
	push	$s0				

main__body:

	li	$t0, 25				# Load 25 into $t0

	jal	ten


	add	$a0, $v0, $t0			# $t0 [25] + ten() [10]
	li	$v0, 1				# syscall 1: print_int
						## note that we set the syscall number after the function call
						## this is crucial, as the return value of the function call
						## would otherwise overwrite the syscall number in $v0
	syscall					# printf("%d");

	li	$v0, 11				# syscall 11: print_char
	li	$a0, '\n'			# 
	syscall					# putchar('\n');



main__epi:					## The only things that should be in the epilogue are pops, end, jr $ra and setting $v0 if you need to
	li	$v0, 0

	pop	$s0
	pop	$ra
	end					## Make sure to end AFTER you pop.

	jr	$ra				# return 0;

################################################################################
# ten
ten:

ten__prologue:
	begin					
	push	$ra


ten__body:
	li	$t0, 10

	jal 	random_number

	li	$v0,	10	# return 10

ten__epilogue:

	pop	$ra
	end
	jr	$ra




################################################################################
# random function - taken from assignment, modified to do nothing but put stuff in registers
random_number:
random_number__prologue:
	begin
	push	$ra

random_number__body:
	li	$t1, 9999999
	move	$t0, $t1		# uint32_t bit = lfsr_state;

	srl	$t3, $t1, 10		# lfsr_state >> 10
	xor	$t0, $t0, $t3		# bit ^= lfsr_state >> 10;

	srl	$t4, $t1, 30		# lfsr_state >> 30
	xor	$t0, $t0, $t4		# bit ^= lfsr_state >> 30;

	srl	$t5, $t1, 31		# lfsr_state >> 31
	xor	$t0, $t0, $t5		# bit ^= lfsr_state >> 31;

	andi	$t0, $t0, 1		# bit &= 0x1u;

	sll	$t6, $t1, 1		# lfsr_state <<= 1;
	or	$t7, $t6, $t0		# lfsr_state |= bit;


random_number__epilogue:
	pop	$ra
	end

	jr	$ra

.data
lfsr_state:
	.space	4