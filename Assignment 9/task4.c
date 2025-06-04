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
        DACR = (0x000 << 6);
        mydelay(0x0F);
        DACR = (0x066 << 6);
        mydelay(0x0F);
        DACR = (0x0CC << 6);
        mydelay(0x0F);
        DACR = (0x133 << 6);
        mydelay(0x0F);
        DACR = (0x199 << 6);
        mydelay(0x0F);
        DACR = (0x1FF << 6);
        mydelay(0x0F);
        DACR = (0x266 << 6);
        mydelay(0x0F);
        DACR = (0x2CC << 6);
        mydelay(0x0F);
        DACR = (0x333 << 6);
        mydelay(0x0F);
        DACR = (0x399 << 6);
        mydelay(0x0F);
        DACR = (0x3FF << 6); // Peak
        mydelay(0x0F);
        DACR = (0x399 << 6);
        mydelay(0x0F);
        DACR = (0x333 << 6);
        mydelay(0x0F);
        DACR = (0x2CC << 6);
        mydelay(0x0F);
        DACR = (0x266 << 6);
        mydelay(0x0F);
        DACR = (0x1FF << 6);
        mydelay(0x0F);
        DACR = (0x199 << 6);
        mydelay(0x0F);
        DACR = (0x133 << 6);
        mydelay(0x0F);
        DACR = (0x0CC << 6);
        mydelay(0x0F);
        DACR = (0x066 << 6);
        mydelay(0x0F);
        DACR = (0x000 << 6); // Back to minimum
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
