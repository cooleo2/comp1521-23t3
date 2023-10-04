#include <stdio.h>
#define N_ROWS 6
#define N_COLS 12


char flag[N_ROWS][N_COLS] = {
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
};

int main(void) {
    int row;
    int col;

main_row_init:
    row = 0;
main_row_cond:
    if (row >= 6) goto main_row_false;
main_col_init:
    col = 0;
main_col_cond:
    if (col >= 12) goto main_col_false;
    printf("%c", flag[row][col]);
main_col_step:
    col++;
    goto main_col_cond;
main_col_false:
    printf("\n");
main_row_step:
    row++;
    goto main_row_cond;
main_row_false:
    return 0;
}
