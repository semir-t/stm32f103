#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "print.h"

void dummy_delay(void);

int main(void)
{
  usart2_init(USART_BAUDRATE_115200);
  print_init(&usart2_tx_byte);

  #include "cat_stm.h" // prints cat on the screen
  while(1)
  {

  }
  return 0;
}

