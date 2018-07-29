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

void sim800_init(void);
uint8_t sim800_at(char * command, char* e_ok);
#endif /* ifndef __SIM800_H */
