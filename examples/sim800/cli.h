#ifndef _CLI_H 
#define _CLI_H 

#include "stm32f1xx.h"
#include "usart.h"
#include "print.h"
#include "color.h"

/*{{{ COMMANDS CONFIG*/
#define NUMBER_OF_COMMANDS            5 
#define MAX_ARGS                      10

#define CMD_HELP                      0
#define CMD_AT                        1 
#define CMD_USSD                      2
#define CMD_SMS                       3
#define CMD_CALL                      4

#define CMD_NAME                      0
#define CMD_ARG                       1

/*{{{ AT*/
#define AT_ARGC                       2
#define AT_CMD                        1
#define AT_E                          2
/*}}}*/
/*{{{ USSD*/
#define USSD_ARGC                     2
#define USSD_NUMBER                   1
/*}}}*/
/*{{{ SMS*/
#define SMS_ARGC                      3
#define SMS_NUMBER                    1
#define SMS_MESSAGE                   2
/*}}}*/
/*{{{*/
#define CALL_ARGC                     2
#define CALL_NUMBER                   1
#define CALL_END                      1
/*}}}*/
/*}}}*/
/*{{{ ERROR CONFIG*/
#define ARGC_ERROR                    0x01
#define ARGV_ERROR                    0x02

#define SET_ARGC_ERROR(err) err|=ARGC_ERROR;
#define SET_ARGV_ERROR(err) err|=ARGV_ERROR;
/*}}}*/

/*! \struct Command 
 *  \brief User defined commands for Command line interface 
 *
 */
typedef struct // struct Command
{
  char * _name; /*!< Name of the command */
  void (*help)(void); /*!< Display help for the command */
  uint8_t (*_execute_command)(uint8_t argc, char *argv[], void * generic_ptr);/*!< Execute this function when
                                                                                command is called */
} Command;

/*! \brief Check if the inserted command is valid
 * 
 *  Check if inserted command is present in base. If command
 *  is valid, parse the input string and return number of
 *  arguments (argc), argument values (argv[]) and ordinal
 *  number of the command(cmd_cnt)
 *
 * \param cmd Input string  
 * \param cmd_cnt Ordinal number of the command 
 * \param argc Number of arguments 
 * \return argv Argument values 
 */
void find_command(char * cmd,int8_t * cmd_cnt, uint8_t * argc, char * argv[]);

/*! \brief Help function for Command line interface 
 *
 * \return No return value
 */
void help();

/*! \brief Help function for at command 
 *
 * \return No return value
 */
void help_at();

/*! \brief Help function for ussd command 
 *
 * \return No return value
 */
void help_ussd();

/*! \brief Help function for sms command 
 *
 * \return No return value
 */
void help_sms();

/*! \brief Help function for call command 
 *
 * \return No return value
 */
void help_call();

/*! \brief Execution function for help command 
 *
 * \param argc Number of argumets
 * \param argv Arguments value  
 * \param generic_ptr Used to transfer custom data not found in command call to a function 
 * \return Error status 
 */
uint8_t cli_help(uint8_t argc, char * argv[], void * generic_ptr);

/*! \brief Execution function for at command 
 *
 * \param argc Number of argumets
 * \param argv Arguments value  
 * \param generic_ptr Used to transfer custom data not found in command call to a function 
 * \return Error status 
 */
uint8_t cli_at(uint8_t argc, char * argv[], void * generic_ptr);

/*! \brief Execution function for ussd command 
 *
 * \param argc Number of argumets
 * \param argv Arguments value  
 * \param generic_ptr Used to transfer custom data not found in command call to a function 
 * \return Error status 
 */
uint8_t cli_ussd(uint8_t argc, char * argv[], void * generic_ptr);

/*! \brief Execution function for sms command 
 *
 * \param argc Number of argumets
 * \param argv Arguments value  
 * \param generic_ptr Used to transfer custom data not found in command call to a function 
 * \return Error status 
 */
uint8_t cli_sms(uint8_t argc, char * argv[], void * generic_ptr);

/*! \brief Execution function for call command 
 *
 * \param argc Number of argumets
 * \param argv Arguments value  
 * \param generic_ptr Used to transfer custom data not found in command call to a function 
 * \return Error status 
 */
uint8_t cli_call(uint8_t argc, char * argv[], void * generic_ptr);

#endif /* ifndef  */

