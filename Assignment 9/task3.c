//DAC program for LPC2148 SUNTECH KIT


#include "LPC214x8.H"                       /* LPC214x definitions */

#define DAC_BIAS			0x00010000
void mydelay(int);

void DACInit( void )
{
	/* setup the related pin to DAC output */
	PINSEL1 &= 0xFFF3FFFF;
	PINSEL1 |= 0x00080000;	/* set p0.25 to DAC output */
	return;
}

int main (void)
{
	int i;
	
	DACInit();
	while(1)
	{
        DACR = (0x184 << 6);
	}
	return 0;

}


