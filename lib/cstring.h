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
#endif /* ifndef __CSTRING_H */
