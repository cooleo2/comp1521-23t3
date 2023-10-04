#include <assert.h>
#include <stdio.h>

// most machines have 32 bit integers
// C standard states this can be anything >= 16 bits
typedef unsigned int Word;

// Helper function
void print_word_binary(char *string, Word value);

Word reverse_bits(Word value) {
    print_word_binary("Value", value);
    Word result = 0;

    for (int i = 0; i < 32; i++) {
        // Determine whether bit i is 1 or 0
        Word mask = 1;
        mask <<= i;
        print_word_binary("mask", mask);

        Word is_one = value & mask;
        print_word_binary("value & mask", is_one);

        // If bit i is a 1, put it into result in the right position
        if (value & mask == 1) {
            Word new_digit = 1;
            // Shifting it into the right place
            new_digit <<= (31 - i);
            //print_word_binary("New Digit", new_digit);
            result |= new_digit;
            //print_word_binary("Result", result);
        }

        
    }


    return result;
}

int main(void) {
    //assert(reverse_bits(0xFFFFFFFF) == 0xFFFFFFFF);
    //assert(reverse_bits(0x00000000) == 0x00000000);
    //a/ssert(reverse_bits(0x1) == 0x80000000);
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