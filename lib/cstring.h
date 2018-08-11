/*! \file cstrin.g
 *  \brief Custom library for string manipulation 
 *  
 * \author Semir Tursunovic (semir-t)
 */
#ifndef __CSTRING_H
#define __CSTRING_H value

#include "stm32f1xx.h"

/*! \brief Save formatted string to buffer
 *
 * \param str String to save to buffer 
 * \param ... Variable number of parameters
 * \return Return formated string 
 */
char * prints(char * str, ...);

/*! \brief Compare two strings 
 *
 *  Returns the following values:
 *    ~ 0  - Two strings are equal
 *    ~ -1 - lhs appears before rhs in lexicographical order.
 *    ~ 1  -  lhs appears after rhs in lexicographical order. 
 * \param lhs First string 
 * \param dhs Second string 
 * \return Compare result as described
 * */
int8_t string_cmp(char * lhs, char * rhs);

uint32_t string_to_number(char * str);
#endif /* ifndef __CSTRING_H */
