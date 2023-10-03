# An introduction to functions in MIPS with a recursive fibonacci implementation
# Any comments starting with a # is what I would expect you to include in
# your own commenting.
#
# Any comments starting with a double ## are for your reference :)


## RULES WITH REGISTERS AND FUNCTION CALLS ##

## we can assume that $s registers will preserve their values
## across function calls

## we have to ASSUME that the value of all $a registers
## were completely destroyed by the function call

## we have to ASSUME that the value of all $t registers
## were completely destroyed by the function call

## THE $a REGISTERS (and global variables which you load and store) ARE THE ONLY 
## MECHANISM YOU HAVE TO COMMUNICATE TO A FUNCTION

## THE $v0 REGISTER IS THE ONLY WAY YOU SHOULD RECEIVE A RESULT FROM A FUNCTION

################################################################################
# .TEXT <main>
	.text
main:
# Args:		void
	# Returns:	int
	#
	# Stack:	[$ra]			## This lists out what you've pushed to the stack
	# Uses:		[$v0, $a0, $t0]		## This lists every register you write to, excluding $ra
	# Clobbers:	[$v0, $a0, $t0]		## This lists every register that you permanently overwrite
	#
	# Locals:
	#	- $t0: int n			## Use this to note how you've used registers within your function.
	# Structure: 
	#	- [prologue]			## This should list out different labels - look at the header comment for fib to get a better idea
	#	- [body]		
	#	- [epilogue]
main__prologue:					## Your prologue should only contain a begin and any pushes to the stack
	begin					## Make sure to have an `end' in your epilogue. You must `begin' before you push.
	push	$ra				## You should never, ever have to push outside of the prologue

main__body:

	li	$v0, 4				# syscall 4: print_string
	la	$a0, enter_number_msg		# 
	syscall					# printf("Enter a number: ");

	li	$v0, 5				# syscall 5: read_int
	syscall					#
	move	$t0, $v0			# scanf("%d", &n);

	li	$v0, 4				# syscall 4: print_string
	la	$a0, fib_msg_1			#
	syscall					# printf("Fibonacci of ");

	li	$v0, 1				# syscall 1: print_int
	move	$a0, $t0			#
	syscall					# printf("%d", n);


	li	$v0, 4				# syscall 4: print_string
	la	$a0, fib_msg_2			#
	syscall					# printf(" is ");

	move	$a0, $t0			## arguments must be passed in $a registers
	jal	fib				# calls fib(n). 	## remember that the moment you use jal, you mush push/pop $ra
	move	$a0, $v0			## functions place their return values in $v0
	li	$v0, 1				# syscall 1: print_int
						## note that we set the syscall number after the function call
						## this is crucial, as the return value of the function call
						## would otherwise overwrite the syscall number in $v0
	syscall					# printf("%d", fib(n));

	li	$v0, 11				# syscall 11: print_char
	li	$a0, '\n'			# 
	syscall					# putchar('\n');



main__epi:					## The only things that should be in the epilogue are pops, end, jr $ra and setting $v0 if you need to
	li	$v0, 0

	pop	$ra
	end					## Make sure to end AFTER you pop.

	jr	$ra				# return 0;

################################################################################
# fib
fib:
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
	#   - ...
	#
	# Structure:
	#   fib
	#   -> [prologue]
	#       -> body
	#   -> [epilogue]

fib__prologue:

fib__body:


	

fib__epilogue:
	
	jr	$ra




## SIDENOTE: What do push and pop actually do? ##

## Back in my day, we didn't have mipsy, which comes with the push/pop pseudoinstructions.
## push $s0 actually turns into these two instructions:
##	addi	$sp, $sp, -4
##	sw	$s0, ($sp)

## The first instruction allocates 4 bytes on the stack by moving the stack pointer ($sp) upwards.
## We require 4 bytes to save a register, since registers are 32-bits, or 4 bytes wide.
## Since this is 4 bytes, we use the sw instruction to save to our newly allocated space.

## Similarly, pop $s0 turns into
## 	lw	$s0, ($sp)
##	addi	$sp, $sp, 4


	.data
enter_number_msg:
	.asciiz	"Enter a number: "
fib_msg_1:
	.asciiz "Fibonacci of "
fib_msg_2:
	.asciiz " is "