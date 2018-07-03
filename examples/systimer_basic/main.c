#include "stm32f1xx.h"
#include "delay.h"


int main(void)
{

/*{{{ PIN CONFIGURATION*/
  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; // enable clock for port GPIOC
  GPIOC->CRH &= ~(0x00f00000); // clean default value (0x44444444) 
  GPIOC->CRH |= 0x00300000; // set pin C13 as output, push-pull
  GPIOC->ODR = 0x0000;
/*}}}*/

  systimer_init(); 
  uint32_t led_time = systimer_get(); 

  while(1)
  {
    if(systimer_timeout_flag(led_time,500) == SYSTIMER_TIMEOUT )
    {
      led_time = systimer_get(); 
      GPIOC->ODR ^= 0x2000;
    }
  }
  return 0;
}

