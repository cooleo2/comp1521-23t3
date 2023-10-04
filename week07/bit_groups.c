#include <stdio.h>
#include <stdint.h>
 
 void print_word_binary(char *string, uint32_t value);

typedef struct six_bit_groups {
    uint8_t middle_bits;
    uint8_t lower_bits;
} six_bit_groups_t;

 
/* 
For example:
00000000 00000101 01000000 01110110 

 
middle six bits are 10 1010
 lower six bits are 11 0110  
*/
 
// TODO
six_bit_groups_t get_bit_groups(uint32_t value) {
    six_bit_groups_t result;

    // Lower 6 bits
    // Mask: 6 1's
    uint32_t mask = 0x3F;
    result.lower_bits = mask & value;

    // Middle 6 bits
    value >>= 13;
    result.middle_bits = mask & value;


    return result;
}
 
int main(void) {
    uint32_t num = 0b00000000000001010100000001110110;
    six_bit_groups_t result = get_bit_groups(num);
    printf("Middle: 0x%x, Lower 0x%x\n", result.middle_bits, result.lower_bits);

    return 0;
}

////////////// HELPER FUNCTIONS //////////////
void print_word_binary(char *string, uint32_t value) {
    printf("%s\n", string);
    for (int i = 31; i >= 0; i--) {
        putchar(((value & ((uint32_t)0x1 << i)) >> i) + 48);
    }
    putchar('\n');
}