#include "gsm.h"
#include "cstring.h"

#define USART3_BUFFER_SIZE          512
#define USART3_LINE                 100
#define TIMEOUT                     5000 
char g_usart3_rx_buffer[USART2_BUFFER_SIZE] = {0};
static uint16_t g_usart3_tx_wcnt = USART3_LINE + 1; 
static uint16_t g_usart3_tx_rcnt = USART3_LINE + 1;
static uint16_t g_usart3_tx_cmdcnt = 0; //for creating valid command string & enables backspace

void USART3_IRQHandler(void)/*{{{*/
{
  g_usart3_rx_buffer[g_usart3_tx_wcnt] = USART3->DR;
  ++g_usart3_tx_wcnt;
  if(g_usart3_tx_wcnt >= USART3_BUFFER_SIZE)
  {
    g_usart3_tx_wcnt = USART3_LINE + 1 ; //reset g_tx_wcnt
  }
}/*}}}*/

static void sim800_buffer_flush(void)/*{{{*/
{
  g_usart3_tx_wcnt = USART3_LINE + 1;
  g_usart3_tx_rcnt = USART3_LINE + 1;
}/*}}}*/
static void sim800_tx_string(char * data)/*{{{*/
{
  uint8_t k = 0;
  while(data[k] != '\0')
  {
    sim800_usart_tx_byte(data[k]);
    ++k;
  }
}/*}}}*/
static char * sim800_get_line(void)/*{{{*/
{
  volatile uint16_t timeout = 0;
  uint8_t status = 0x01;
  while ((status) && (timeout < TIMEOUT))
  {
    if (g_usart3_tx_wcnt != g_usart3_tx_rcnt)
    {
      char current_char = g_usart3_rx_buffer[g_usart3_tx_rcnt++];
      g_usart3_rx_buffer[g_usart3_tx_cmdcnt++] = current_char;
      if (current_char == '\n')
      {
        g_usart3_rx_buffer[g_usart3_tx_cmdcnt++] = '\0';
        status = 0x00;
      }
      if (g_usart3_tx_rcnt >= USART3_BUFFER_SIZE)
      {
        g_usart3_tx_rcnt = USART3_LINE + 1;
      }
      timeout = 0;
    }
    else
    {
      /* print("%d\n",timeout); */
      ++timeout;
      delay_ms(1);
    }
    if ((g_usart3_tx_cmdcnt + 1) >= USART3_LINE)
    {
      g_usart3_rx_buffer[USART3_LINE] = '\0';
    }
  }
  g_usart3_tx_cmdcnt = 0;
  if (status) 
  {
    g_usart3_rx_buffer[g_usart3_tx_cmdcnt] = '\0';
  }
  return g_usart3_rx_buffer;
}/*}}}*/

void sim800_init(void)/*{{{*/
{
  sim800_usart_init(USART_BAUDRATE_9600);
  usart3_irq_enable();
}/*}}}*/
void sim800_at(char * command)/*{{{*/
{
  sim800_buffer_flush();
  sim800_tx_string(command);
  sim800_usart_tx_byte('\n');
}/*}}}*/
char * sim800_at_response(char * response)/*{{{*/
{
  char * gsm_line = sim800_get_line();
  return string_cpy(response,gsm_line);
}/*}}}*/
uint8_t sim800_wait_for_response(char * response)/*{{{*/
{
  char at_response[100];
  char at_expected[50];
  string_cpy(at_expected,prints("%s\n",response));
  do
  {
    print("%s",sim800_at_response(at_response));
  } while((string_cmp(at_response,at_expected) != 0) && (at_response[0] != '\0'));
  return at_response[0] == '\0' ? 1 : 0;
}/*}}}*/
