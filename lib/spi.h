#ifndef __SPI_H
#define __SPI_H 

#include "stm32f1xx.h"

//---------------------------------------------------------------
//SPI BAUDRATE PRESCALER 
//---------------------------------------------------------------
#define SPI_BAUDRATE_PRESCALER_2          ((uint16_t)0x0000)
#define SPI_BAUDRATE_PRESCALER_4          ((uint16_t)0x0008)
#define SPI_BAUDRATE_PRESCALER_8          ((uint16_t)0x0010)
#define SPI_BAUDRATE_RPESCALER_16         ((uint16_t)0x0018)
#define SPI_BAUDRATE_PRESCALER_32         ((uint16_t)0x0020)
#define SPI_BAUDRATE_PRESCALER_64         ((uint16_t)0x0028)
#define SPI_BAUDRATE_PRESCALER_128        ((uint16_t)0x0030)
#define SPI_BAUDRATE_PRESCALER_256        ((uint16_t)0x0038)

//---------------------------------------------------------------
//SPI MODE
//---------------------------------------------------------------
#define SPI_MODE_0                        0x00
#define SPI_MODE_1                        0x01
#define SPI_MODE_2                        0x02
#define SPI_MODE_3                        0x03

//---------------------------------------------------------------
//SPI DATA SIZE 
//---------------------------------------------------------------
#define SPI_1B_FRAME                      ((uint16_t)0x0000)
#define SPI_2B_FRAME                      ((uint16_t)0x0800) 

//---------------------------------------------------------------
//SPI SS MACROS 
//---------------------------------------------------------------
#define SPI1_SS_HIGH					            GPIOB->ODR |= (0x0001)
#define SPI1_SS_LOW						            GPIOB->ODR &= ~(0x0001)

//---------------------------------------------------------------
//SPI FLAGS
//---------------------------------------------------------------
#define SPI_FLAG_RXNE                     ((uint16_t)0x0001)
#define SPI_FLAG_TXE                      ((uint16_t)0x0002)
#define SPI_FLAG_CHSIDE                   ((uint16_t)0x0004)
#define SPI_FLAG_UDR                      ((uint16_t)0x0008)
#define SPI_FLAG_CRCERR                   ((uint16_t)0x0010)
#define SPI_FLAG_MODF                     ((uint16_t)0x0020)
#define SPI_FLAG_OVR                      ((uint16_t)0x0040)
#define SPI_FLAG_BSY                      ((uint16_t)0x0080)


//---------------------------------------------------------------
//SPI 1
//---------------------------------------------------------------
/*! \brief Initialize SPI in master mode 
 *
 *  SPI is configured for 8 bit data trasnfer with MSB. Arbitrary 
 *  pin can be used as SS. Any changes should be done in source 
 *  code.
 *
 * \param spi_prescaler SPI clock configuration. Macros provided
 *                      should be used as arguments when calling
 *                      a function.
 * \param spi_mode      SPI mode configuration. Macros provided
 *                      should be used as arguments when calling
 *                      a function.
 * \return No return value 
 */
void spi1_master_init(uint16_t spi_prescaler,uint8_t spi_mode);

//---------------------------------------------------------------
//SPI 2
//---------------------------------------------------------------
/* void spi2_master_init(uint16_t spi_prescaler,uint8_t spi_mode); */

//---------------------------------------------------------------
//SPI DATA TRANSFER 
//---------------------------------------------------------------

/*! \brief Receive byte via SPI 
 *
 * Function for receiving data is blocking.
 *
 * \param  SPI    SPI peripheral used for receiving data
 * \return Return received byte 
 */
uint8_t	spi_rx_byte(SPI_TypeDef * SPI);
/*! \brief Send byte via SPI 
 *
 * \param  SPI    SPI peripheral used for receiving data
 * \param  data   Data which will be sent 
 * \return Return received byte 
 */
uint8_t	spi_tx_byte(SPI_TypeDef * SPI, uint8_t data);

#endif /* ifndef __SPI_H */

