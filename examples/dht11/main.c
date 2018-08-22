#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "print.h"
#include "dht11.h"


int main(void)
{
  /*{{{ Initialize peripheral*/
  usart2_init(USART_BAUDRATE_115200);         // Used for debugging and data representation 
  print_init(usart2_tx_byte);                 // Used for debugging and data representation 
  dht11_init();
  /*}}}*/
  
  /*{{{ PIN CONFIGURATION*/
  print("SYS-> START\n");
  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; // enable clock for port GPIOC
  GPIOC->CRH &= ~(0x00f00000); // clean default value (0x44444444) 
  GPIOC->CRH |= 0x00300000; // set pin C13 as output, push-pull
  GPIOC->ODR = 0x0000;
  /*}}}*/

  GPIOC->ODR &= ~0x2000;
  uint8_t data[5];
  uint8_t status = 0;
  while(1)
  {
    /* delay_ms(1); */
    while(dht11_read(data) == DHT11_E_TIMEOUT)
    {
      print("ERROR\n");
      delay_ms(5000);
    }
    print("HUM: %d.%d\n",data[0],data[1]);
    print("TEMP: %d.%d\n",data[2],data[3]);
    delay_ms(5000);
  }
  return 0;
}



