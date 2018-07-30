#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "print.h"
#include "cli.h"
#include "sim800.h"
#include "cstring.h"

extern Command commands[NUMBER_OF_COMMANDS];

int main(void)
{
  char * command = 0;
  int8_t cmd_number = 0;
  uint8_t argc = 0;
  char * argv[MAX_ARGS];

  sim800_init();
  usart2_init(USART_BAUDRATE_115200);
  usart2_irq_enable();
  print_init(usart2_tx_byte);
  help(); // Show intro
  /*{{{ PIN CONFIGURATION*/
  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; // enable clock for port GPIOC
  GPIOC->CRH &= ~(0x00f00000); // clean default value (0x44444444) 
  GPIOC->CRH |= 0x00300000; // set pin C13 as output, push-pull
  GPIOC->ODR = 0x0000;
  /*}}}*/

  GPIOC->ODR &= ~0x2000;
  while(1)
  {
    uint8_t error = 0x00;
    command = (char *) usart2_read_rx_buffer();
    if(command)
    {
      find_command(command,& cmd_number,& argc, argv);
      if( cmd_number < NUMBER_OF_COMMANDS )
      {
          error = commands[cmd_number]._execute_command(argc,argv,0); 
      }
      else
      {
        SET_ARGC_ERROR(error);
      }
      print(DIM);
      if(error & ARGV_ERROR)
      {
        print(RED "  %s:" BLUE"some of arguments do not have correct type!\n",commands[cmd_number]._name);

      }
      else if(error & ARGC_ERROR)
      {
        print(RED "  ERROR:" BLUE" unknown command\n");

      }
      print(RESET);
    }
  }
  return 0;
}

