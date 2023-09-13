// read 32-byte hexadecimal numbers from a file
// and print low (least significant) byte
// as a signed decimal number (-128..127)

#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <file>\n", argv[0]);
        return 1;
    }


    FILE *stream = fopen(argv[1], "r");
    if (stream == NULL) {
        perror(argv[1]);
        return 1;
    }

    int32_t number;
    while (fscanf(stream, "%x", &number) == 1) { 


        // EXAMPLE
        // Lowest byte: 1010 0000 (if signed, the leftmost bit is 1 so it is negative).
        // Extended to 32 bit signed twos complement: 1111 1111 1111 1111 1111 1111 1010 0000
        // However, if 1010 0000 was unsigned 
        // Extended to unsigned 32 bit number:        0000 0000 0000 0000 0000 0000 1010 0000 
        // These are similar! Just flipped.

        // TODO: Implement getting the low_byte and printing

    }
    fclose(stream);

    return 0;
}