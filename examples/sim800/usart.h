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
#define MAX_COMMAND_LENGHT 128 

/*{{{ Common functions*/
/*! \brief Send 1 byte of data using USART on STM32F1xx
 *
 * \param  USART Select USART peripheral. 
 * \param  data Send this data via selected USART
 * \return No return value
 */
void usart_tx_byte(USART_TypeDef * USART,uint8_t data);

/*! \brief Receive 1 byte of data using USART on STM32F1xx
 *
 * \param  USART Select USART peripheral. 
 * \return Return data received via USART
 */
uint8_t usart_rx_byte(USART_TypeDef * USART);

/*! \brief Check if there is data to read 
 *
 * \param  USART Select USART peripheral. 
 * \return Return status 
 */
uint8_t usart_rx_available(USART_TypeDef * USART);
/*}}}*/
/*{{{ USART2*/
/*! \brief Initialize USART on STM32F1xx 
 *
 * \param  baudrate Set USART baudrate. 
 * \return No return value
 */
void usart2_init(uint16_t baudrate);

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
char * usart2_read_rx_buffer(void);

/*! \brief Send 1 byte of data using USART2 on STM32F1xx
 * 
 *  Used for print functions.
 *
 * \param  data Send this data via selected USART2
 * \return No return value
 */
void usart2_tx_byte(uint8_t data);

/*! \brief Receive 1 byte of data using USART2 on STM32F1xx
 * 
 * \return Return data received via USART2
 */
uint8_t usart2_rx_byte();

/*}}}*/
/*{{{ USART3*/
/*! \brief Initialize USART on STM32F1xx 
 *
 * \param  baudrate Set USART baudrate. 
 * \return No return value
 */
void usart3_init(uint16_t baudrate);

/*! \brief Enable IRQ for USART3 
 *
 *  Generate IRQ for RXNE (RX not empty).
 * \return No return value
 */
void usart3_irq_enable(void);

/*! \brief Disable IRQ for USART3 
 *
 *  Don't generate IRQ for RXNE (RX not empty).
 * \return No return value
 */
void usart3_irq_disable(void);

/*! \brief USART3 IRQ handler function 
 *
 * Function called when USART3 generates IRQ request.
 * \return No return value
 */
void USART3_IRQHandler(void);

#endif /* end of include guard: USART_H_RL1KETST */

