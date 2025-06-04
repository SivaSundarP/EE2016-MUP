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
		DACR = (0x000 << 6); // Step 1
		mydelay(0x0F);
		DACR = (0x048 << 6); // Step 2
		mydelay(0x0F);
		DACR = (0x090 << 6); // Step 3
		mydelay(0x0F);
		DACR = (0x0D8 << 6); // Step 4
		mydelay(0x0F);
		DACR = (0x120 << 6); // Step 5
		mydelay(0x0F);
		DACR = (0x168 << 6); // Step 6
		mydelay(0x0F);
		DACR = (0x1B0 << 6); // Step 7
		mydelay(0x0F);
		DACR = (0x1F8 << 6); // Step 8
		mydelay(0x0F);
		DACR = (0x240 << 6); // Step 9
		mydelay(0x0F);
		DACR = (0x288 << 6); // Step 10
		mydelay(0x0F);
		DACR = (0x2E2 << 6); // Final step (maximum)
		mydelay(0x0F);
	}
	return 0;
}
void mydelay(int x)
{
	int j,k;
	for(j=0;j<=x;j++)
	{
		for(k=0;k<=0xFF;k++);
	}
}

