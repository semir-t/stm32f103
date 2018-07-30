/*! \file sim800.h
 *  \brief Drive for SIM800 GSM module 
 *  
 * \author Semir Tursunovic (semir-t)
 */
#ifndef __SIM800_H
#define __SIM800_H 

#include <stm32f1xx.h>
#include "usart.h"
#include "delay.h"

/*{{{ SIM800 CORE*/
#define sim800_usart_init(baudrate)               usart3_init(baudrate)
#define sim800_usart_tx_byte(data)                usart_tx_byte(USART3,data)
#define sim800_usart_rx_byte()                    usart_rx_byte(USART3)
/*}}}*/

/*! \brief Initialize SIM800 GSM module 
 *
 * \return No return value
 */
void sim800_init(void);

/*! \brief Send AT command to GSM 
 *
 * \param  command Command to send to GSM 
 * \return Return value is reserved for future use 
 */
uint8_t sim800_at(char * command);

/*! \brief Read GSM respond after AT command 
 *
 * After some AT commands are sent and OK respond is received, GSM
 * starts to send appropriate data which can be receied with this 
 * function. Max length of the string which can be received is 255 
 * characters.
ent* \return Return received string 
 */
char * sim800_at_rx_data();
#endif /* ifndef __SIM800_H */
