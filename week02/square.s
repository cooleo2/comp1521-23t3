.text
main:
	# $t0 : x
	# $t1 : y

    	li      $v0, 4
    	la      $a0, prompt_str     # printf("Enter a number: ");
    	syscall

	li	$v0, 5		# scanf("%d", &x);
	syscall			# Scanned result is in $v0
	move	$t0, $v0	# Moving result into $t0

	mul	$t1, $t0, $t0	# y = x * x;

	li	$v0, 1		#printf("%d", y);
	move	$a0, $t1
	syscall

	li	$v0, 11		#printf("\n");
	li	$a0, '\n'
	syscall


    	li      $v0, 0 		# return 0
    	jr      $ra

.data
prompt_str:
    .asciiz "Enter a number: "