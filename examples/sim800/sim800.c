#include "sim800.h"
#include "print.h"

#define RX_BUFFER_SIZE                50
#define SIM800_ECHO                   0x01

volatile char g_sim800_rx_buffer[RX_BUFFER_SIZE];

/*{{{ Private*/
static void sim800_tx_string(char * data)/*{{{*/
{
  uint8_t k = 0;
  while(data[k] != '\0')
  {
    sim800_usart_tx_byte(data[k]);
    ++k;
  }
}/*}}}*/
static char * sim800_rx_string()/*{{{*/
{
  uint8_t data = 0;
  do
  {
    //wait for first \r\n
    data = sim800_usart_rx_byte();
  } while(data != '\n');
  uint8_t cnt = 0;
  do
  {
    //record GSM respons
    data = sim800_usart_rx_byte();
    if(data != '\r')
    {
      g_sim800_rx_buffer[cnt++] = data;
    }

  } while((cnt < RX_BUFFER_SIZE) && (data != '\n') );
  g_sim800_rx_buffer[--cnt] = '\0';
  return g_sim800_rx_buffer;
}/*}}}*/
static int8_t strcmp(char * lhs, char * rhs)/*{{{*/
{
  while((*lhs != '\0') && (*lhs == *rhs))
  {
    print("%c === %c\n",*lhs,*rhs);
    ++lhs;
    ++rhs;
  }

  print("%d === %d\n",*lhs,*rhs);
  int8_t status = *lhs < *rhs ? -1 : *lhs > *rhs;
  print("status: %d\n",status);
  return status;
}/*}}}*/

/*}}}*/
/*{{{ Public*/
void sim800_init(void)/*{{{*/
{
  sim800_usart_init(USART_BAUDRATE_9600);
}/*}}}*/
uint8_t sim800_at(char * command, char * e_ok)/*{{{*/
{
  sim800_tx_string(command);
  sim800_usart_tx_byte('\n');

  char * respond = sim800_rx_string();
  print("\t %s\n",respond);
  uint8_t status = 0;
  if(strcmp(respond,e_ok))
  {
    status = 1;
  }
  return status;
}/*}}}*/
/*}}}*/
