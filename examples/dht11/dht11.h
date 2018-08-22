#ifndef __DHT11_H_
#define __DHT11_H_

#include "stm32f1xx.h"
#include "delay.h"
#include "usart.h"
#include "print.h"

/*{{{ DHT11 TIMEOUT ERROR DETECTION*/
#define DHT11_TIMEOUT     100
#define DHT11_E_OK        0x00
#define DHT11_E_TIMEOUT   0x01
/*}}}*/
/*{{{ DHT11 DATA FORMAT*/
#define DHT11_HUM_DEC					0x00
#define DHT11_HUM_FRAC				0x01
#define DHT11_TEMP_DEC			  0x02
#define DHT11_TEMP_FRAC			  0x03
#define DHT11_CHECK_SUM			  0x04
/*}}}*/

/*! \brief Initialize pin connected to DHT11 
 *
 * Enable clock for used GPIO and set used pin as input.
 * We have to wait more then 1s for DHT11 to get stable.
 * \return No return value
 */
void dht11_init(void);

/*! \brief Read Humidity and Temperature 
 *
 * \param  sdata 5 element array containing data received from DHT11 
 * \return Return TIMEOUT error 
 */
uint8_t dht11_read(uint8_t * data);

/*! \brief Read temperature 
 *
 * \param  sdata 2 element array containing temperature data received from DHT11 
 * \return Return TIMEOUT error 
 */
uint8_t dht11_read_temperature(uint8_t * data);

/*! \brief Read Humidity 
 *
 * \param  sdata 2 element array containing humidity data received from DHT11 
 * \return Return TIMEOUT error 
 */
uint8_t dht11_read_humidity(uint8_t * data);

#endif 
