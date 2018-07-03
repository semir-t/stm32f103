/*! \file print.h
 *  \brief Implementation of the print() function
 *  
 * Function print() replicates the behaviour of the standard printf() 
 * function. It is essential to call print_init() function at the startup.
 * This function receives address of the usart_tx_char() function.
 * Length of the string that can be printed via USART is limited to 128 
 * characters.
 * 
 * \author Semir Tursunovic (semir-t)
 */

#ifndef _PRINT_H
#define _PRINT_H 

#include "stdarg.h"
#include "stm32f1xx.h"

#define MAX_PRINT_STRING_SIZE 128

/*! \brief print() initialization
 *
 * \param  *usart_tx_byte  address of the function
 * \return No return value
 */
void print_init(void (*usart_tx_byte)(uint8_t));

/*! \brief Get info about number of digits used to represent numerical value
 *
 * \param  str Pointer to character of the string
 * \return width Number of digits used to represent numerical value 
 */
uint8_t number_width(char ** str);

/*! \brief Print number via USART 
 *
 * \param num Number to print
 * \param base Number will be printed in accordance with base (2,8,10,16)
 * \param width Number of digits used to represent numerical value 
 * \return No return value
 */
void print_number(int num,uint8_t base,uint8_t width);

/*! \brief Print formated string 
 *
 * \param str String to print
 * \param ... Variable number of parameters
 * \return No return value 
 */
void print(char * str, ...);

/*! \brief Send string via serial interface (UART) 
 *
 * \param  str String to send via UART
 * \return No return value
 */
void sprint(uint8_t * str);

#endif /* ifndef _PRINT_H */
