#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto small_big;
    if (x >= 1000) goto small_big;

medium:
    printf("medium\n");
    goto epilogue;

small_big:
    printf("small/big\n");

epilogue:
    return 0;

}
