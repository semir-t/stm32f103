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

#define USART2_BUFFER_SIZE 512
#define MAX_COMMAND_LENGHT 64

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

/*! \brief Enable IRQ for USART2 
 *
 *  Generate IRQ for RXNE (RX not empty).
 * \return No return value
 */
void usart2_irq_enable(void);

/*! \brief Disable IRQ for USART2 
 *
 *  Don't generate IRQ for RXNE (RX not empty).
 * \return No return value
 */
void usart2_irq_disable(void);

/*! \brief USART2 IRQ handler function 
 *
 * Function called when USART2 generates IRQ request.
 * \return No return value
 */
void USART2_IRQHandler(void);

/*! \brief Read content of the rx buffer 
 *
 * This function prints content of the rx buffer to the users screen. 
 * When ENTER key is pressed this function returns string which was
 * entered by the user via keyboard.
 *
 * This function should be called frequently.
 * \return 0 or entered string
 * */
uint8_t * usart2_read_rx_buffer(void);

#endif /* end of include guard: USART_H_RL1KETST */
