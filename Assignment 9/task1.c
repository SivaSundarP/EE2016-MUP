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
	DACR = (0x200 << 6);
	mydelay(0x0F);
	DACR = (0x24F << 6);
	mydelay(0x0F);
	DACR = (0x299 << 6);
	mydelay(0x0F);
	DACR = (0x2E6 << 6);
	mydelay(0x0F);
	DACR = (0x328 << 6);
	mydelay(0x0F);
	DACR = (0x369 << 6);
	mydelay(0x0F);
	DACR = (0x39E << 6);
	mydelay(0x0F);
	DACR = (0x3C8 << 6);
	mydelay(0x0F);
	DACR = (0x3E6 << 6);
	mydelay(0x0F);
	DACR = (0x3F9 << 6);
	mydelay(0x0F);
	DACR = (0x3FF << 6);
	mydelay(0x0F);
	DACR = (0x3F9 << 6);
	mydelay(0x0F);
	DACR = (0x3E6 << 6);
	mydelay(0x0F);
	DACR = (0x3C8 << 6);
	mydelay(0x0F);
	DACR = (0x39E << 6);
	mydelay(0x0F);
	DACR = (0x369 << 6);
	mydelay(0x0F);
	DACR = (0x328 << 6);
	mydelay(0x0F);
	DACR = (0x2E6 << 6);
	mydelay(0x0F);
	DACR = (0x299 << 6);
	mydelay(0x0F);
	DACR = (0x24F << 6);
	mydelay(0x0F);
	DACR = (0x200 << 6);
	mydelay(0x0F);
	DACR = (0x1B4 << 6);
	mydelay(0x0F);
	DACR = (0x167 << 6);
	mydelay(0x0F);
	DACR = (0x11A << 6);
	mydelay(0x0F);
	DACR = (0x0D8 << 6);
	mydelay(0x0F);
	DACR = (0x0D3 << 6);
	mydelay(0x0F);
	DACR = (0x097 << 6);
	mydelay(0x0F);
	DACR = (0x061 << 6);
	mydelay(0x0F);
	DACR = (0x037 << 6);
	mydelay(0x0F);
	DACR = (0x018 << 6);
	mydelay(0x0F);
	DACR = (0x006 << 6);
	mydelay(0x0F);
	DACR = (0x000 << 6);
	mydelay(0x0F);
	DACR = (0x006 << 6);
	mydelay(0x0F);
	DACR = (0x018 << 6);
	mydelay(0x0F);
	DACR = (0x037 << 6);
	mydelay(0x0F);
	DACR = (0x061 << 6);
	mydelay(0x0F);
	DACR = (0x097 << 6);
	mydelay(0x0F);
	DACR = (0x0D3 << 6);
	mydelay(0x0F);
	DACR = (0x0D8 << 6);
	mydelay(0x0F);
	DACR = (0x11A << 6);
	mydelay(0x0F);
	DACR = (0x167 << 6);
	mydelay(0x0F);
	DACR = (0x1B4 << 6);
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

