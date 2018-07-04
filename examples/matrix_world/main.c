#include "stm32f1xx.h"
#include "max7219.h"
#include "delay.h"


int main(void)
{
  max7219_init(PRESCALER_128);
  while (1)
  {
    max7219_display_scroll("Hello there",UPSIDE_DOWN,LEFT,100);
    delay_ms(1000);
  }
  return 0;
}

