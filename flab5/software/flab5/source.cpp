/*
 * source.cpp
 *
 *  Created on: 02.03.2020
 *      Author: maro4_000
 */
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

#define MAX_DATA_VALUE	255
#define CPU_DIV_COEFF	4000
#define BIT_COUNT		8

void divide_cpu_clock(void)
{
	alt_u16 i;
	for(i = 0; i < CPU_DIV_COEFF; i++);
};

//int main(void) __attribute__((weak, alias("alt_main")));
int alt_main(void)
{
	/*// DECLARATION BLOCK
	alt_u16 data;			// Data to transmit
	alt_u8 temp;			// Temporary value
	alt_u8 parity_bit;		// Parity bit value
	alt_u8 current_bit;		// Current data bit
	// DECLARATION BLOCK ENDS

	IOWR_ALTERA_AVALON_PIO_DIRECTION(PIO_0_BASE, 0x1f);

	while(1)
		for(data = 0; data < (MAX_DATA_VALUE + 1); data++) {
			parity_bit = 0;
			current_bit = 0;

			// Send start-bit
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 0x1f);
			divide_cpu_clock();

			// Send data
			for(current_bit = 0; current_bit < BIT_COUNT; current_bit++) {
				temp = (data >> current_bit) & 1;
				parity_bit ^= temp;
				IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, temp*0x1f);
				divide_cpu_clock();
			};

			// Send two stop-bits
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 0);
			divide_cpu_clock();
			IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 0);
			divide_cpu_clock();
		};
	return 0;*/
	char leds = 0x1;
	    int i = 0;
	    while(1)
	    {
	        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, leds);
	        //for (i=0; i<(ALT_CPU_CPU_FREQ/500); i++);    // Delay
	        // Johnson code counter on leds
	        leds = ((leds<<1) & 0xE) | (!(leds>>3) & 0x1);
	    }
	    return 0;
}

int main(void)
{
	char leds = 0x1;
	    int i = 0;
	    while(1)
	    {
	        IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, leds);
	        //for (i=0; i<(ALT_CPU_CPU_FREQ/500); i++);    // Delay
	        // Johnson code counter on leds
	        leds = ((leds<<1) & 0xE) | (!(leds>>3) & 0x1);
	    }
	    return 0;
}
