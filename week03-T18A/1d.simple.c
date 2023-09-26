#include <stdio.h>
#define N_ELEMENTS 5

int main(void) {
    char array[N_ELEMENTS] = {'h', 'e', 'l', 'l', 'o'};
    int i;
    
main_i_init:
    i = 0;
main_i_cond:
    if (i >= N_ELEMENTS) goto main_i_false;
main_i_body:
    putchar(array[i]);
    putchar('\n');
main_i_step:
    i++;
    goto main_i_cond;
main_i_false:

    return 0;
}


// What if we had
// int array[N_ELEMENTS] = {3, 1, 4, 1, 5};

