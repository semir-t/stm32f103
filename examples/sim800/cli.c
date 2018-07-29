#include "cli.h"
#include "delay.h"

Command commands[NUMBER_OF_COMMANDS] =
{{"help",help, cli_help},
 {"at",help_at,cli_at},
 {"ussd",help_ussd,cli_ussd},
  /* {"adc1",help_adc1,cli_adc1}, */
  /* {"fir",help_fir,cli_fir}, */
  /* {"stat", help_stat,cli_stat} */
};


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Private functions
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
static int8_t string_compare(char * lhs, char* rhs)/*{{{*/
{
  while(*lhs && (*lhs == *rhs))
  {
    ++lhs;
    ++rhs;
  }
  return *lhs < *rhs ? -1 : *lhs > *rhs;
}/*}}}*/
static uint32_t str_to_int(uint8_t * str)/*{{{*/ //only positive numbers
{
  uint8_t k = 0;
  uint32_t number = 0;
  for(k = 0; str[k] !='\0'; ++k)
  {
    number = number  * 10 + (str[k] - '0');
  }
  return number; 
}/*}}}*/
static float str_to_float(uint8_t * str)/*{{{*/
{
  uint8_t k = 0;
  uint8_t sign = 0;
  uint16_t fraction_cnt= 0;
  float decimal = 0;
  float fraction = 0;
  float number = 0;
  sign = str[k] == '-' ? 1 : 0;
  for(k = sign; str[k] !='.' && str[k] != '\0'; ++k)
  {
    decimal = decimal  * 10 + (str[k] - '0');
  }
  for(++k,fraction_cnt = 1; str[k] != '\0'; ++k )
  {
    if(fraction_cnt > 1000)
    {
      break;
    }
    fraction = fraction * 10 + (str[k] - '0');
    fraction_cnt *= 10;
  }
  number = decimal + fraction/fraction_cnt;
  return sign ? number * (-1) : number ; 
}/*}}}*/
static float aps_sum(float a1, float a2)/*{{{*/
{
  a1 = a1 > 0 ? a1 : (a1 * (-1));
  a2 = a2 > 0 ? a2 : (a2 * (-1));
  return a1 + a2;
}/*}}}*/

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Public functions
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void find_command(uint8_t * cmd,int8_t * cmd_number, uint8_t * argc, uint8_t * argv[MAX_ARGS]) /*{{{*/
{
  *cmd_number = -1;
  * argc = 0;
  uint8_t cmd_cnt = 0;
  if(*cmd != '\0') 
  {
    argv[(*argc)++] = cmd;
  }
  else
  {
    return;
  }
  while(*cmd != '\0')
  {
    if(*argc >= MAX_ARGS)
    {
      print(DIM RED "  ERROR:" BLUE" unknown command\n" RESET);
      return;
    }
    //Get string (text between quotes) as one argument.
    if(*(cmd + 1) == '"')
    {
      *cmd++ = '\0';
      *cmd++ = '\0';
      if(*cmd != '\0')
      {
        argv[(*argc)++] = cmd;
      }
      while(*cmd != '"' && *cmd != '\0')
      {
        ++cmd;
        //loop until end of the string is reacher
      }
      if(*cmd != '\0')
      {
        *cmd++ = '\0';
      }
      continue;
    }
    //Get arguments for all other cases.
    if (*cmd == ' '|| *cmd == '\n')  //  testing '\n' because backspace replaces char wtih'\n'
    {
      while(*cmd == ' ' || *cmd == '\n')
      {
        *cmd++ = '\0';
      }
      if(*cmd != '\0')
      {
        argv[(*argc)++] = cmd;
      }
      continue;
    }
    ++cmd;
  }
  // Test if the command is present in the data base
  for(cmd_cnt = 0; cmd_cnt < NUMBER_OF_COMMANDS; ++cmd_cnt)
  {
    char * cmd_name  = (char *) argv[0];
    /* #if DEBUG */
    /*     print("-> SYS: command_name_input: %s \n",cmd_name); */
    /* print("-> SYS: command_name_databse: %s \n",commands[cmd_cnt]._name); */
    /* print("-> SYS: compare: %d\n",string_compare(cmd_name,commands[cmd_cnt]._name)); */
    /* #endif */
    if(string_compare(cmd_name,commands[cmd_cnt]._name))
    {
      continue;
    }
    else
    {
      *cmd_number = cmd_cnt;
      return;
    }
  }
  print(DIM RED "  ERROR:" BLUE" unknown command\n" RESET);
  return;
}/*}}}*/


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Custom commands
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uint8_t cli_help(uint8_t argc, uint8_t * argv[], void * generic_ptr)/*{{{*/
{
  uint8_t k = 0;
  for(k = 0; k < NUMBER_OF_COMMANDS; ++k)
  {
    commands[k].help();
  }
  return 0;
}/*}}}*/
void help()/*{{{*/
{
  print("\n" RESET DIM BLUE CLEAN_DISPLAY);
  print("-----------------------------------------------------------\n");
  print("|                   COMMAND LINE INTERFACE                |\n");
  print("|                     FOR SIM800 v1.0                     |\n");
  print("-----------------------------------------------------------\n\n");
  print(RESET);
}/*}}}*/

uint8_t cli_ussd(uint8_t argc, uint8_t * argv[], void * generic_ptr)/*{{{*/
{

  return 0;
}/*}}}*/
void help_ussd()/*{{{*/
{
  print("\n" RESET DIM BLUE CLEAN_DISPLAY);
  print("-----------------------------------------------------------\n");
  print("|                   COMMAND LINE INTERFACE                |\n");
  print("|                     FOR SIM800 v1.0                     |\n");
  print("-----------------------------------------------------------\n\n");
  print(RESET);
}/*}}}*/

uint8_t cli_at(uint8_t argc, uint8_t * argv[],void * generic_ptr)/*{{{ */
{
  uint8_t error = 0;
  if(argc ==  AT_ARGC)
  {
    if(sim800_at(argv[AT_CMD],argv[AT_E]))
    {
      print(">"RED" AT COMMAND NOT SUCCESSFUL\n");
    }
    else
    {
      print(">"DIM BLUE" AT COMMAND SUCCESSFUL\n");
    }
    print(RESET);
  }
  else
  {
    SET_ARGC_ERROR(error);
  }
  return error;
}/*}}}*/
void help_at(void)/*{{{*/
{

}/*}}}*/

//---------------------------------------------------------------
//SIM
//---------------------------------------------------------------
//AT+CPIN?
//+CPIN: READY
//OK
//SIM is ready
//---------------------------------------------------------------
////Voice call
//---------------------------------------------------------------
//{
//Checking registration status...
//AT+CREG?
//+CREG: 0,1
//OK
//The device is registered in home network.
//Dialing number +38761053182
//ATD+38761053182;
//OK
//Voice call successfull
//Hanging up the call..
//ATH
//OK
//Call sucessfully dis-connected..
//}
//---------------------------------------------------------------
//Send SMS
//---------------------------------------------------------------
//{
//Checking registration status...
//AT+CREG?
//+CREG: 0,1
//OK
//The device is registered in home network.
//Checking SMS Mode...
//AT+CMGF?
//+CMGF: 0
//OK
//SMS message for is configured for PDU mode
//Checking SMS Mode...
//Setting Character Set to GSM
//AT+CSCS="GSM"
//OK
//SMS Service center entry is empty.Not including this field in the PDU
//AT+CMGS=24
//+CMGS: 4
//OK
//}
//---------------------------------------------------------------
//USSD
//---------------------------------------------------------------
//{
//Set device character set to GSM
//AT+CSCS="GSM"
//OK
//AT+CUSD=1,"*100#",15
//OK
//+CUSD: 0, "Vas kredit iznosi 5.30 KM i krajnji datum vazenja Vaseg Ultra kredita je 25.08.2018.", 15
//}
