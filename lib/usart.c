#include "usart.h"

void usart2_init(uint16_t baudrate)/*{{{*/
{
  //enable clock for USART
  RCC->APB1ENR |= RCC_APB1ENR_USART2EN;
  //enable clock for Tx and Rx pins
  RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
  GPIOA->CRL &= ~(GPIO_CRL_MODE2_0 | GPIO_CRL_MODE2_1 | GPIO_CRL_CNF2_0 | GPIO_CRL_CNF2_1 |
                  GPIO_CRL_MODE3_0 | GPIO_CRL_MODE3_1 | GPIO_CRL_CNF3_0 | GPIO_CRL_CNF3_1);
  GPIOA->CRL |= (GPIO_CRL_MODE2_0 | GPIO_CRL_MODE2_1 | GPIO_CRL_CNF2_1); //TX(alt - push_pull - 50mhz)
  GPIOA->CRL |= (GPIO_CRL_CNF2_0); //RX(floating input)

  //USART CONFIGURATION:
  //  - 8 bit data
  //  - 1 stop bit
  //  - no polarity bit
  USART2->BRR = baudrate;
  USART2->CR1 |= USART_CR1_RE | USART_CR1_TE | USART_CR1_UE;
}/*}}}*/
void usart2_tx_byte(uint8_t data)/*{{{*/
{
  while (!(USART2->SR & USART_SR_TC))
  {
    //wait until previus transfer is complete
  }
  USART2->DR = data;
}/*}}}*/
uint8_t usart2_rx_byte(void)/*{{{*/
{
  while (!(USART2->SR & USART_SR_RXNE))
  {
    // waitin to receive data
  }
  return USART2->DR;
}/*}}}*/


