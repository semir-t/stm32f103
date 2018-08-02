#include "sim800.h"
#include "print.h"
#include "cstring.h"

#define RX_BUFFER_SIZE                256 
#define SIM800_ECHO                   0x01

#define SIM800_RX_STRING_FLAG_DATA    0x00
#define SIM800_RX_STRING_FLAG_COMMAND 0x00

char g_sim800_rx_buffer[RX_BUFFER_SIZE];

/*{{{ Private*/
static void sim800_tx_line(char * data)/*{{{*/
{
  uint8_t k = 0;
  while(data[k] != '\0')
  {
    sim800_usart_tx_byte(data[k]);
    ++k;
  }
}/*}}}*/
static char * sim800_rx_line(uint8_t flag)/*{{{*/
{
  uint8_t data = 0;
  uint8_t cnt = 0;
  do
  {
    /* //wait for first \r\n */
    data = sim800_usart_rx_byte();
    g_sim800_rx_buffer[cnt++] = data;
  } while ((data != '\n') && (cnt < RX_BUFFER_SIZE));
  cnt = cnt < RX_BUFFER_SIZE ? cnt : (RX_BUFFER_SIZE - 1);
  g_sim800_rx_buffer[cnt] = '\0';
  return g_sim800_rx_buffer;
}/*}}}*/

/*}}}*/
/*{{{ Public*/
void sim800_init(void)/*{{{*/
{
  sim800_usart_init(USART_BAUDRATE_9600);
}/*}}}*/
void sim800_at(char * command)/*{{{*/
{
  print("%s\n",command);
  sim800_tx_line(command);
  sim800_usart_tx_byte('\n');
  /* char * respond = sim800_rx_string(SIM800_RX_STRING_FLAG_COMMAND); */
  /* print("%s\n",respond); */
  return ;
}/*}}}*/

char * sim800_at_rx_data(uint8_t line_cnt)/*{{{*/
{
  char * line;
  do
  {
      line = sim800_rx_line(0);
  } while (--line_cnt);
  return line;
}/*}}}*/

uint8_t sim800_sms(char * number, char * message)/*{{{*/
{
  sim800_at("ATE0");
  print("%s",sim800_at_rx_data(2));
  sim800_at("AT+CREG?");
  print("%s",sim800_at_rx_data(4));
  sim800_at("AT+CMGF=1");
  print("%s",sim800_at_rx_data(2));
  sim800_at("AT+CSCS=\"GSM\"");
  print("%s",sim800_at_rx_data(2));
  char * string = prints("AT+CMGS=\"%s\"\n",number);
  print("%s",string);
  sim800_tx_line(string);
  /* sim800_usart_tx_byte('\n'); */
  /* sim800_usart_rx_byte(); // get CR */
  /* sim800_usart_rx_byte(); // get LF */
  sim800_at_rx_data(1); // get <CR><LF>
  print("%c ",sim800_usart_rx_byte()); // get '>' 
  print("%s\n",message);
  sim800_tx_line(message);
  sim800_usart_tx_byte(0x1a);
  print("Respond %s\n",sim800_at_rx_data(4));
  sim800_at("ATE1");
  print("%s",sim800_at_rx_data(2));
}/*}}}*/
uint8_t sim800_call(char * number, uint8_t action)/*{{{*/
{
  if(action == SIM800_CALL)
  {
    sim800_at("AT+CREG?");
    print("%s",sim800_at_rx_data(4));
    char * command = prints("ATD%s;",number);
    sim800_at(command);
    print("%s",sim800_at_rx_data(2));
  }
  else
  {
    sim800_at("ATH");
    print("%s",sim800_at_rx_data(2));
  }
}/*}}}*/
uint8_t sim800_http(uint8_t request,char * site,uint8_t * data)
{
  sim800_at("AT+SAPBR=3,1,\"APN\",\"active.bhmobile.ba\"");
  print("%s",sim800_at_rx_data(2));
  sim800_at("AT+SAPBR=1,1");
  print("%s",sim800_at_rx_data(2));

  sim800_at("AT+HTTPINIT");
  print("%s",sim800_at_rx_data(2));
  sim800_at("AT+HTTPPARA=\"CID\",1");
  print("%s",sim800_at_rx_data(2));
  char * http_url = prints("AT+HTTPPARA=\"URL\",\"%s\"",site);
  print("SYS->HTTP_URL: %s\n",http_url);
  sim800_at(http_url);
  print("%s",sim800_at_rx_data(2));
  if(request == SIM800_HTTP_GET)
  {
    sim800_at("AT+HTTPACTION=0");
    print("%s",sim800_at_rx_data(4));
    /* print("SYS-> %s\n",sim800_at_rx_data()); */
    //read respons and get value for data length
    sim800_at("AT+HTTPREAD=0,47");
    print("%s",sim800_at_rx_data(4));
    /* print("SYS-> %s\n",sim800_at_rx_data()); */
  }
  else if(request == SIM800_HTTP_POST)
  {
    sim800_at("AT+HTTPDATA=100,10000");
    print("%s",sim800_at_rx_data(2));
    /* print("SYS-> DATA: %s",data); */
    sim800_tx_line("3,8,2018");
    sim800_usart_tx_byte('\n');
    sim800_tx_line("18,58,15,255");
    sim800_usart_tx_byte('\n');
    sim800_tx_line("18,58,15,255");
    sim800_usart_tx_byte('\n');
    /* sim800_tx_line("18,58,15,255\n"); */
    print("%s",sim800_at_rx_data(2));
    sim800_at("AT+HTTPACTION=1");
    print("%s",sim800_at_rx_data(4));
  }
  else
  {
    //head
  }
  sim800_at("AT+HTTPTERM");
  print("%s",sim800_at_rx_data(2));
}

/*}}}*/
