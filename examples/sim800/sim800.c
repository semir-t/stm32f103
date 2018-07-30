#include "sim800.h"
#include "print.h"
#include "cstring.h"

#define RX_BUFFER_SIZE                256 
#define SIM800_ECHO                   0x01

#define SIM800_RX_STRING_FLAG_DATA    0x00
#define SIM800_RX_STRING_FLAG_COMMAND 0x00

char g_sim800_rx_buffer[RX_BUFFER_SIZE];

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
static char * sim800_rx_string(uint8_t flag)/*{{{*/
{
  uint8_t data = 0;
  uint8_t cnt = 0;
  uint8_t line_cnt = 1;
  uint8_t line_start = 1;
  do
  {
    /* //wait for first \r\n */
    data = sim800_usart_rx_byte();
    if(data == '\r' || data == '\n')
    {
      g_sim800_rx_buffer[cnt++] = data;
    }
  } while(data != '\n');
  do
  {
    //record GSM respons
    data = sim800_usart_rx_byte();
    g_sim800_rx_buffer[cnt++] = data;
    if(line_start && data == '+' && flag)
    {
      line_cnt += 2;
    }
    if(data == '\n')
    {
      --line_cnt;
      line_start = 1;
    }
    line_start = 0;
  } while((cnt < RX_BUFFER_SIZE) && line_cnt );
  g_sim800_rx_buffer[cnt] = '\0';
  return g_sim800_rx_buffer;
}/*}}}*/

/*}}}*/
/*{{{ Public*/
void sim800_init(void)/*{{{*/
{
  sim800_usart_init(USART_BAUDRATE_9600);
}/*}}}*/
uint8_t sim800_at(char * command)/*{{{*/
{
  print("%s\n",command);
  sim800_tx_string(command);
  sim800_usart_tx_byte('\n');
  char * respond = sim800_rx_string(SIM800_RX_STRING_FLAG_COMMAND);
  print("%s\n",respond);
  return 0;
}/*}}}*/
char * sim800_at_rx_data()/*{{{*/
{
  return sim800_rx_string(SIM800_RX_STRING_FLAG_DATA);
}/*}}}*/

uint8_t sim800_sms(char * number, char * message)/*{{{*/
{
  sim800_at("ATE0");
  sim800_at("AT+CREG?");
  sim800_at("AT+CMGF=1");
  sim800_at("AT+CSCS=\"GSM\"");
  char * string = prints("AT+CMGS=\"%s\"",number);
  print("%s\n",string);
  sim800_tx_string(string);
  sim800_usart_tx_byte('\n');
  sim800_usart_rx_byte(); // get CR
  sim800_usart_rx_byte(); // get LF
  print("%c ",sim800_usart_rx_byte()); // get '>'
  print("%s\n",message);
  sim800_tx_string(message);
  sim800_usart_tx_byte(0x1a);
  string = sim800_rx_string(SIM800_RX_STRING_FLAG_COMMAND );
  print("Respond %s\n",string);
  sim800_at("ATE1");
}/*}}}*/
uint8_t sim800_call(char * number, uint8_t action)/*{{{*/
{

}/*}}}*/

/*}}}*/
