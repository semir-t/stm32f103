/*! \file gsm.h
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

/*{{{ SIM800 CALL*/
#define SIM800_CALL               0x01
#define SIM800_CALL_END           0x00
/*}}}*/
/*{{{ SIM800 HTTP*/
#define SIM800_HTTP_GET           0x00
#define SIM800_HTTP_POST          0x01
#define SIM800_HTTP_HEAD          0x02
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
void sim800_at(char * command);


char * sim800_at_response(char * response);

uint8_t sim800_wait_for_response(char * response);

/*! \brief Read GSM respond after AT command 
 *
 * After some AT commands are sent and OK respond is received, GSM
 * starts to send appropriate data which can be receied with this 
 * function. Max length of the string which can be received is 255 
 * characters.
ent* \return Return received string 
 */
char * sim800_at_rx_data(uint8_t line_cnt);

uint8_t sim800_sms(char * number, char * message);
#endif /* ifndef __SIM800_H */

