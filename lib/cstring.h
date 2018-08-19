/*! \file cstrin.g
 *  \brief Custom library for string manipulation 
 *  
 * \author Semir Tursunovic (semir-t)
 */
#ifndef __CSTRING_H
#define __CSTRING_H value

#include "stm32f1xx.h"

/*! \brief Save formatted string to destination string 
 *
 * \param destination Destination string 
 * \param str String to save to destination string 
 * \param ... Variable number of parameters
 * \return Return formated string 
 */
char * prints(char * destination,char * str, ...);

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
int8_t string_cmp(const char * lhs, const char * rhs);

/*! \brief Copy rhs string to lhs  
 *
 * lhs string must have enough space to store rhs string
 * \param lhs Destination string 
 * \param dhs Source string 
 * \return Pointer to destination string 
 * */
char * string_cpy(char * lhs, const char * rhs);

/*! \brief Split string to substrings  
 *
 * lhs string must have enough space to store rhs string
 * \param line String which we want to split to substrings 
 * \param argc Number of substrings 
 * \param argv Array of substrings 
 * \param delimiter String which contatins delimiters
 * \return Return 1 if max number of substrings is exceeded 
 * */
uint8_t string_split(char * line, uint8_t * argc, char * argv[],char * delimiter);

/*! \brief Convert string to number 
 *
 * \param str Number in string format 
 * \return uint32_t type number 
 * */
uint32_t string_to_number(char * str);

#endif /* ifndef __CSTRING_H */

