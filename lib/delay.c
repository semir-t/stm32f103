#include "delay.h"

void delay_ms(uint32_t delay)/*{{{*/
{
  RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; // enable clock for TIM2 (48MHz)
  TIM2->CR1 |= TIM_CR1_ARPE;   // Enable auto-reload register
  TIM2->PSC = 72 - 1; // output clock will be 1 MHz
  TIM2->ARR = 1000; // over flow will accure every ms
  TIM2->EGR |= TIM_EGR_UG;
  TIM2->CR1 |= TIM_CR1_CEN;
  while (delay)
  {
    while(!(TIM2->SR & TIM_SR_UIF)) // wait for overflow
    {
    }
    TIM2->SR &= ~(TIM_SR_UIF);
    --delay;
  }
  TIM2->CR1 &= ~(TIM_CR1_CEN);
  return;
}/*}}}*/
void delay_us(uint32_t delay)/*{{{*/
{
  RCC->APB1ENR |= RCC_APB1ENR_TIM2EN; // enable clock for TIM2 (48MHz)
  TIM2->CR1 |= TIM_CR1_ARPE;   // Enable auto-reload register
  TIM2->PSC = 1 - 1; // output clock will be 72 MHz
  TIM2->ARR = 72; // over flow will accure every us
  TIM2->EGR |= TIM_EGR_UG;
  TIM2->CR1 |= TIM_CR1_CEN;
  while (delay)
  {
    while(!(TIM2->SR & TIM_SR_UIF)) // wait for overflow
    {
    }
    TIM2->SR &= ~(TIM_SR_UIF);
    --delay;
  }
  TIM2->CR1 &= ~(TIM_CR1_CEN);
  return;
}/*}}}*/
