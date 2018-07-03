/*! \file usart.h
 *  \brief USART functionality on STM32F1xx
 *  
 *  
 * \author Semir Tursunovic (semir-t)
 */

#ifndef USART_H_RL1KETST
#define USART_H_RL1KETST

#include "stm32f1xx.h"

//----------------------------------------------------------
//BAUDRATE CONFIG
//----------------------------------------------------------
#define USART_BAUDRATE_9600                       0x0ea6
#define USART_BAUDRATE_115200                     0x0138

/*! \brief Initialize USART2 on STM32F1xx 
 *
 * \param  baudrate Set USART baudrate. 
 * \return No return value
 */
void usart2_init(uint16_t baudrate);

/*! \brief Send 1 byte of data using USART2 on STM32F1xx
 *
 *  
 * \param  data Send this data via USART2
 * \return No return value
 */
void usart2_tx_byte(uint8_t data);

/*! \brief Receive 1 byte of data using USART2 on STM32F1xx
 *
 * \note Function not tested
 * \return Return data received via USART2
 */
uint8_t usart2_rx_byte(void);


#endif /* end of include guard: USART_H_RL1KETST */
