#include <stdio.h>

int main(void) {
    int i;
    int numbers[10] = {0};


    while (i < 10) {
        scanf("%d", &numbers[i]);
        i++;
    }
main_scan_loop_init:
    i = 0;
main_scan_loop_cond:
    if (i >= 10) goto main_scan_loop_false;
main_scan_loop_body:
    scanf("%d", &numbers[i]);
main_scan_loop_step:
    i++;
    goto main_scan_loop_cond;
main_scan_loop_false:

    i = 0;
    while (i < 10) {
        printf("%d ", numbers[i]);
        i++;
    }

main_print_loop_init:
main_print_loop_cond:
main_print_loop_body:
main_print_loop_step:
main_print_loop_false:
}
