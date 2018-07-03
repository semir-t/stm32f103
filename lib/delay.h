/*! \file delay.h
 *  \brief Timing functions for STM32F1xx
 *  
 * Functions delay_ms() and delay_us() are using TIM4.
 * SYSTIMER is using TIM2. 
 * 
 * \author Semir Tursunovic (semir-t)
 */
#ifndef DELAY_H_PXTIYRQG
#define DELAY_H_PXTIYRQG

#include "stm32f1xx.h"

#define SYSTIMER_TIMEOUT 0
#define SYSTIMER_KEEP_ALIVE 1

/*! \brief Pause in the code execution. Resolution in milliseconds
 *
 * This function is based on TIM4.
 *
 * \param  delay Waiting time
 * \return No return value
 */
void delay_ms(uint32_t delay);

/*! \brief Pause in the code execution. Resolution in microseconds
 *
 * This function is based on TIM4.
 *
 * \param  delay Waiting time in us
 * \return No return value
 */
void delay_us(uint32_t delay);



/*! \brief Initialization of the systimer
 *
 * SYSTIMER is based on TIM2 
 * \return No return value
 */
void systimer_init(void);


/*! \brief Get current value of the systimer
 *
 * 
 * \return Current value of the systimer 
 */
uint32_t systimer_get(void);

/*! \brief SYSTIMER timout flag 
 *
 * \return SYSTIMER_TIMEOUT || SYSTIMER_KEEP_ALIVE
 */
uint8_t systimer_timeout_flag(uint32_t current_time, uint32_t period);

//TODO: Stopwatch can be implemented if needed
/* void stopwatch_init(void); */
/* void stopwatch_start(void); */
/* uint32_t stopwatch_stop(void); */

#endif /* end of include guard: DELAY_H_PXTIYRQG */
