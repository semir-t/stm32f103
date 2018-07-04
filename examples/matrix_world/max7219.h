//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Library for MAX7219 that enables us to control 8x8
//LED matrix display. 
//
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#ifndef __MAX7219_H  
#define __MAX7219_H

#include "stm32f1xx.h"
#include "delay.h"
#include "spi.h"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Chose SPI
// - Software SPI  0
// - Hardware SPI  1
  #define SPI 1
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#if SPI 
  #include "spi.h"
#else
  #include "spi_software.h"
#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//SPI core
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#define MAX7219_SS_LOW                SPI1_SS_LOW
#define MAX7219_SS_HIGH               SPI1_SS_HIGH
#define max7219_tx(data)              spi_tx_byte(SPI1,data)
#define max7219_spi_init(prescaler)   spi1_master_init(prescaler,SPI_MODE_0)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Matrix configuration
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define NUMBER_OF_DEVICES       3
#define MATRIX_ROWS             8
#define MATRIX_COLS             8 
#define FONT_SIZE               8

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//User defined macros
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define BUFFER_ROWS             8
#define BUFFER_COLS             (NUMBER_OF_DEVICES + 1)
#define BUFFER_SIZE             ((NUMBER_OF_DEVICES + 1) * 8)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//Data transfer speed
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#if SPI 
#define PRESCALER_2             SPI_BAUDRATE_PRESCALER_2 
#define PRESCALER_4             SPI_BAUDRATE_PRESCALER_4 
#define PRESCALER_8             SPI_BAUDRATE_PRESCALER_8 
#define PRESCALER_16            SPI_BAUDRATE_PRESCALER_16 
#define PRESCALER_32            SPI_BAUDRATE_PRESCALER_32 
#define PRESCALER_64            SPI_BAUDRATE_PRESCALER_64 
#define PRESCALER_128           SPI_BAUDRATE_PRESCALER_128 
#define PRESCALER_256           SPI_BAUDRATE_PRESCALER_256 
#else
#define PRESCALER_2             0 
#define PRESCALER_4             0
#define PRESCALER_8             0
#define PRESCALER_16            0
#define PRESCALER_32            0
#define PRESCALER_64            0
#define PRESCALER_128           0
#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 ADDRESS MAP
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MAX7219_NOP             0x00
#define MAX7219_DIG0            0x01
#define MAX7219_DIG1            0x02
#define MAX7219_DIG2            0x03
#define MAX7219_DIG3            0x04
#define MAX7219_DIG4            0x05
#define MAX7219_DIG5            0x06
#define MAX7219_DIG6            0x07
#define MAX7219_DIG7            0x08
#define MAX7219_DECODE_MODE     0x09
#define MAX7219_INTENSITY       0x0a
#define MAX7219_SCAN_LIMIT      0x0b
#define MAX7219_SHUTDOWN        0x0c
#define MAX7219_DISPLAY_TEST    0x0f

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 SHUTDOWN REGISTER
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MAX7219_OFF             0x00
#define MAX7219_ON              0x01
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 DECODE REGISTER
//  -no BCD decode
//  -first digit BCD decode
//  - 0-3 digits BCD decode
//  - 0-7 (all) digits BCD decode
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MAX7219_NO_DECODE       0x00
#define MAX7219_DECODE0         0x01
#define MAX7219_DECODE0_3       0x0f
#define MAX7219_DECODE0_7       0xff

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 INTENSITY REGISTER
//  MAX7129_X where X is all odd numbers from 0 to 31
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MAX7219_1               0x00
#define MAX7219_3               0x01
#define MAX7219_5               0x02
#define MAX7219_7               0x03
#define MAX7219_9               0x04
#define MAX7219_11              0x05
#define MAX7219_13              0x06
#define MAX7219_15              0x07
#define MAX7219_17              0x08
#define MAX7219_19              0x09
#define MAX7219_21              0x0a
#define MAX7219_23              0x0b
#define MAX7219_25              0x0c
#define MAX7219_27              0x0d
#define MAX7219_29              0x0e
#define MAX7219_31              0x0f

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 TEST DISPLAY REGISTER
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MAX7219_DISPLAY_TEST_OFF 0x00
#define MAX7219_DISPLAY_TEST_ON  0x01

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 ROTATION VALUES 
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define MAX7219_COUNTER_CLOCKWISE_90    0x01
#define MAX7219_COUNTER_CLOCKWISE_180   0x02
#define MAX7219_COUNTER_CLOCKWISE_270   0x03
#define MAX7219_CLOCKWISE_90            0x03
#define MAX7219_CLOCKWISE_180           0x02
#define MAX7219_CLOCKWISE_270           0x01
#define UPSIDE                          0x03
#define UPSIDE_DOWN                     0x01
#define RIGHT                           0x02
#define LEFT                            0x00

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//MAX7219 SCROLL VALUES 
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#define SCROLL_RIGHT                    0x00
#define SCROLL_LEFT                     0x01


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//USER DEFINED FUNCTIONS
////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/*! \brief Initialize max7219
*
* This function is used for initializing max7219 with
* initial configuration settings. Also, this function initializes
* hardware or software SPI communication.
*
* \param Prescaler value for SPI communications
* \return Returns void
*/
void max7219_init(uint8_t prescaler);

void max7219_test(uint8_t test_state);
void max7219_display_clean(void);

void max7219_tx_byte(uint8_t address, uint8_t data);
void max7219_tx_data(uint8_t address, uint8_t data);
void max7219_tx_char(uint8_t character,uint8_t font);
void max7219_rotate(uint8_t data[], uint8_t rotate_direction);


uint8_t max7219_display_scroll(char * string,uint8_t orientation, uint8_t direction,uint8_t speed);
void max7219_display_char(uint8_t device_no,uint8_t data,uint8_t orientation);


/* void max7219_buffer_load(uint8_t *, uint8_t, uint8_t, uint8_t); */
/* void max7219_display_refresh(void); */


#endif /* ifndef  */
