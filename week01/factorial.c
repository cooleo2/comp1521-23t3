#include <stdio.h>

int factorial(int n);

int main(void) {
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);
    printf("%d! = %d\n", n, factorial(n));
    return 0;
}

int factorial(int n) {
    // Base Case
    if (n == 0) {
        return 1;
    }

    // Do the recursion
    int result = n * factorial(n - 1);
    return result;
}
