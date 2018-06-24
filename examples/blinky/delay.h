/*! \file delay.h
 *  \brief Timing functions for STM32F1xx
 *  
 * Function delay_ms() and delay_us() are using TIM2
 * 
 * \author Semir Tursunovic (semir-t)
 */
#ifndef DELAY_H_PXTIYRQG
#define DELAY_H_PXTIYRQG

#include "stm32f1xx.h"

/*! \brief Pause in the code execution. Resolution in milliseconds
 *
 * This function is based on TIM2.
 *
 * \param  delay Waiting time
 * \return No return value
 */
void delay_ms(uint32_t delay);

/*! \brief Pause in the code execution. Resolution in microseconds
 *
 * This function is based on TIM2.
 *
 * \param  delay Waiting time in us
 * \return No return value
 */
void delay_us(uint32_t delay);


#endif /* end of include guard: DELAY_H_PXTIYRQG */
