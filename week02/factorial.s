main:

	# $t0: n
	# $t1: fac
	# $t2: i

    li      	$v0, 4
    la      	$a0, n_eq_str     # printf("n  = ");
    syscall
    
    li		$v0, 5		# scanf("%d", &n);
    syscall			# Scanned result is in $v0
    move	$t0, $v0	# Moving result into $t0


    li		$t1, 1		# fac = 1
    
main_i_init:
    li		$t2, 1 		#int i = 1;
main_i_cond:
    bgt		$t2, $t0, main_i_false	#if (i > n) goto main_i_false
main_i_body:
    mul		$t1, $t1, $t2 #fac = fac * i;
main_i_step:
    add		$t2, $t2, 1 #i++;
    j main_i_cond
main_i_false:

    #printf("n! = %d\n", fac);
    li      	$v0, 4
    la      	$a0, n_eq_str     # printf("n  = ");
    syscall
    
    li      	$v0, 1
    move      	$a0, $t1
    syscall
    
    li	$v0, 11		#printf("\n");
    li	$a0, '\n'
    syscall

    li      $v0, 0
    jr      $ra

.data
n_eq_str:
    .asciiz "n  = "
