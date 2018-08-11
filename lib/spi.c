#include "spi.h"


//---------------------------------------------------------------
//SPI 1
//---------------------------------------------------------------
void spi1_master_init(uint16_t spi_prescaler,uint8_t spi_mode)/*{{{*/
{
  //---------------------------------------------------------------
  //SPI PIN CONFIGURATION 
  //MOSI - PA7 - AF_PP
  //MISO - PA6 - IF_PP
  //SCK  - PA5 - AF_PP
  //SS   - PB0 - OUT_PP
  //---------------------------------------------------------------
  RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;        //enable clock
  //CONFIGURE MOSI & SCK (AF_PP)
  GPIOA->CRL &= ~(0xf0f00000);                //reset value to 0;
  GPIOA->CRL |= 0xb0b00000;                   //set GPIO as AF_PP and OUT_50MHz
  //CONFIGURE MISO
  GPIOA->CRL &= ~(0x0f000000);                //reset value to 0;
  GPIOA->CRL |= 0x08000000;                   //set GPIO as IF_PP
  GPIOA->ODR |= 0x0040;                       //set GPIO as PP

  //CONFIGURE SS
  RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;        //enable clock
  GPIOB->CRL &= ~(0x0000000f);                //reset value to 0;
  GPIOB->CRL |= 0xb0b00003;                   //set GPIO as OUT_PP
  SPI1_SS_HIGH;                               //SS HIGH

  //---------------------------------------------------------------
  //SPI CONFIGURATION 
  //MASTER MODE
  //8 BIT MSB FRAME FORMAT
  //ARBITRARY SS PIN
  //---------------------------------------------------------------
  RCC->APB2ENR |= RCC_APB2ENR_SPI1EN; 	        // enable clock for SPI1
  SPI1->CR1 |= spi_prescaler;		                // Set SPI prescaler
  SPI1->CR1 |= (spi_mode & 0x03 );              // 
  SPI1->CR1 |= SPI_1B_FRAME | SPI_CR1_MSTR;     // enable 8 bit data & master mode
  SPI1->CR1 |= (SPI_CR1_SSI)|(SPI_CR1_SSM);     // Use arbitrary GPIO as SS
  SPI1->CR1 |= (SPI_CR1_SPE);	                  // Enable SPI

}/*}}}*/

//---------------------------------------------------------------
//SPI DATA TRANSFER 
//---------------------------------------------------------------
uint8_t spi_rx_byte(SPI_TypeDef * SPI)/*{{{*/
{
  uint8_t slave_data;

  SPI->DR = 0x00; 												
  while(!(SPI->SR & SPI_FLAG_TXE));
  while(!(SPI->SR & SPI_FLAG_RXNE));
  slave_data = SPI->DR; 									
  while(SPI->SR & SPI_FLAG_BSY); 	

  return slave_data;
}	/*}}}*/
uint8_t spi_tx_byte(SPI_TypeDef * SPI, uint8_t data)/*{{{*/
{
  uint8_t slave_data;

  SPI->DR = data; 												
  while(!(SPI->SR & SPI_FLAG_TXE));
  while(!(SPI->SR & SPI_FLAG_RXNE));
  slave_data = SPI->DR; 									
  while(SPI->SR & SPI_FLAG_BSY); 	

  return slave_data;
}/*}}}*/
