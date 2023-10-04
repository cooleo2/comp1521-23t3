// A simple, recursive, non-memoized fibonacci implementation.
// Abiram Nadarajah, October 2021
#include <stdio.h>

int fib(int n) {
fib_n_lt2_cond:
    if (n >= 2) goto fib_n_lt2_false;
    return n;
fib_n_lt2_false:
    int result = fib(n - 2);
    return fib(n - 1) + result;
}

int main(void) {
    printf("Enter a number: ");
    int n;
    scanf("%d", &n);

    printf("Fibonacci of %d is %d\n", n, fib(n));
    return 0;
}
