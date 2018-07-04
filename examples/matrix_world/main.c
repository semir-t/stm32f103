#include "stm32f1xx.h"
#include "max7219.h"
#include "delay.h"

void fet_blink();

int main(void)
{
  max7219_init(PRESCALER_128);
  while (1)
  {
    max7219_display_scroll("Fakultet elektrotehnike Tuzla",UPSIDE_DOWN,LEFT,100);
    max7219_display_char(3,'F',UPSIDE_DOWN);
    max7219_display_char(2,'E',UPSIDE_DOWN);
    max7219_display_char(1,'T',UPSIDE_DOWN);
    delay_ms(5000);
    /* max7219_display_scroll("Fakultet elektrotehnike Tuzla",RIGHT,LEFT,100); */
    uint8_t k = 0;
    for(k = 0; k < 5; ++k)
    {
      fet_blink();
    }
  }
  return 0;
}

void fet_blink()
{
  max7219_display_char(3,'F',UPSIDE_DOWN);
  max7219_display_char(2,'E',UPSIDE_DOWN);
  max7219_display_char(1,'T',UPSIDE_DOWN);
  delay_ms(500);
  max7219_display_char(3,' ',UPSIDE_DOWN);
  max7219_display_char(2,' ',UPSIDE_DOWN);
  max7219_display_char(1,' ',UPSIDE_DOWN);
  delay_ms(500);
}
