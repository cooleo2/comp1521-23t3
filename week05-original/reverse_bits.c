#include <assert.h>
#include <stdio.h>

// most machines have 32 bit integers
// C standard states this can be anything >= 16 bits
typedef unsigned int Word;

// Helper function
void print_word_binary(char *string, Word value);

Word reverse_bits(Word value) {
    print_word_binary("Value: ", value);
    return 0;
}

int main(void) {
    //assert(reverse_bits(0xFFFFFFFF) == 0xFFFFFFFF);
    //assert(reverse_bits(0x00000000) == 0x00000000);
    //assert(reverse_bits(0x1) == 0x80000000);
    //assert(reverse_bits(0x2) == 0x40000000);
    assert(reverse_bits(0x01234567) == 0xE6A2C480);
    printf("All tests passed!\n");
    return 0;
}

////////////// HELPER FUNCTIONS //////////////
void print_word_binary(char *string, Word value) {
    printf("%s\n", string);
    for (int i = 31; i >= 0; i--) {
        putchar(((value & ((Word)0x1 << i)) >> i) + 48);
    }
    putchar('\n');
}