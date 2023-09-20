main:
	# $t0: x

    li      	$v0, 4
    la      	$a0, prompt_str     # printf("Enter a number: ");
    syscall
    
    li		$v0, 5		# scanf("%d", &x);
    syscall			# Scanned result is in $v0
    move	$t0, $v0	# Moving result into $t0


    ble		$t0, 100, small_big # if (x <= 100) goto small_big;
    bge		$t0, 1000, small_big # if (x >= 1000) goto small_big;

medium:
    li      	$v0, 4
    la      	$a0, medium_str     # printf("medium\n");
    syscall

    j  		medium

small_big:
    li      	$v0, 4
    la      	$a0, small_big_str     # printf("small/big\n");
    syscall

epilogue:
    li      $v0, 0	# return 0
    jr      $ra


.data
prompt_str:
    .asciiz "Enter a number: "
medium_str:
    .asciiz "medium\n"
small_big_str:
    .asciiz "small/big\n"