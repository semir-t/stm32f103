#ifndef _CLI_H 
#define _CLI_H 

#include "stm32f1xx.h"
#include "usart.h"
#include "print.h"
#include "color.h"

#define NUMBER_OF_COMMANDS            2 
#define MAX_ARGS                      10

#define CMD_HELP                      0
#define CMD_AT                        1 
#define CMD_USSD                      2

#define CMD_NAME                      0
#define CMD_ARG                       1


#define AT_ARGC                       3
#define AT_CMD                        1
#define AT_E                          2

#define ARGC_ERROR                    0x01
#define ARGV_ERROR                    0x02

#define SET_ARGC_ERROR(err) err|=ARGC_ERROR;
#define SET_ARGV_ERROR(err) err|=ARGV_ERROR;

static char * cmd_name[NUMBER_OF_COMMANDS] = {"HELP","AT","USSD"};

typedef struct // struct Command
{
  char * _name;
  void (*help)(void);
  uint8_t (*_execute_command)(uint8_t argc, uint8_t *argv[], void * generic_ptr);
} Command;


void find_command(uint8_t * cmd,int8_t * cmd_cnt, uint8_t * argc, uint8_t * argv[]);


uint8_t cli_help(uint8_t argc, uint8_t * argv[], void * generic_ptr);
uint8_t cli_at(uint8_t argc, uint8_t * argv[], void * generic_ptr);
uint8_t cli_ussd(uint8_t argc, uint8_t * argv[], void * generic_ptr);

void help();
void help_at();
void help_ussd();

#endif /* ifndef  */

