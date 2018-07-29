#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "print.h"
#include "cli.h"
#include "sim800.h"

extern Command commands[NUMBER_OF_COMMANDS];

int main(void)
{
  uint8_t * command = 0;
  int8_t cmd_number = 0;
  uint8_t argc = 0;
  uint8_t * argv[MAX_ARGS];

  sim800_init();
  usart2_init(USART_BAUDRATE_115200);
  usart2_irq_enable();
  print_init(usart2_tx_byte);
  print("-> START\n");
  uint8_t data = 0;
  uint8_t * str = 0;
  /*{{{ PIN CONFIGURATION*/
  RCC->APB2ENR |= RCC_APB2ENR_IOPCEN; // enable clock for port GPIOC
  GPIOC->CRH &= ~(0x00f00000); // clean default value (0x44444444) 
  GPIOC->CRH |= 0x00300000; // set pin C13 as output, push-pull
  GPIOC->ODR = 0x0000;
  /*}}}*/

  GPIOC->ODR ^= 0x2000;
  while(1)
  {
    uint8_t error = 0x00;
    command = usart2_read_rx_buffer();
    if(command)
    {
      /* sim800_at(command,"OK"); */
      uint8_t error = 0;
      find_command(command,& cmd_number,& argc, argv);
      switch(cmd_number)
      {
        case CMD_HELP:
          error = commands[cmd_number]._execute_command(argc,argv,0); 
          break;
        case CMD_AT:
          error = commands[cmd_number]._execute_command(argc,argv,0); 
          break;
          /* case CMD_ADC1: */ 
          /* error = commands[cmd_number]._execute_command(argc,argv,0); */ 
          /* break; */
          /* case CMD_FIR: */
          /*   error = commands[cmd_number]._execute_command(argc,argv,0); */ 
          /* break; */
          /* case CMD_STAT: */
          /* error = commands[cmd_number]._execute_command(argc,argv,0); */ 
          /* break; */
      }
          print(DIM);
          if(error & ARGV_ERROR)
          {
            print(RED "  %s:" BLUE"some of arguments do not have correct type!\n",cmd_name[cmd_number]);

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

