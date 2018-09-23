#include "gsm.h"
#include "cstring.h"

#define USART3_BUFFER_SIZE          512
#define USART3_LINE                 100
#define TIMEOUT                     3000 
#define PARSER_MAX_ARGS             10

volatile char g_usart3_rx_buffer[USART2_BUFFER_SIZE] = {0};
volatile uint16_t g_usart3_tx_wcnt = USART3_LINE + 1; 
volatile uint16_t g_usart3_tx_rcnt = USART3_LINE + 1;
volatile uint16_t g_usart3_tx_cmdcnt = 0; //for creating valid command string & enables backspace

void USART3_IRQHandler(void)/*{{{*/
{
  g_usart3_rx_buffer[g_usart3_tx_wcnt] = USART3->DR;
  /* print("%c\n",g_usart3_rx_buffer[g_usart3_tx_wcnt]); */
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
      ++timeout;
      delay_ms(2);
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
static char sim800_get_char(void)/*{{{*/
{
  char current = '\0';
  if(g_usart3_tx_rcnt != g_usart3_tx_wcnt)
  {
    current = g_usart3_rx_buffer[g_usart3_tx_rcnt];
    ++g_usart3_tx_rcnt;
    if (g_usart3_tx_rcnt >= USART3_BUFFER_SIZE)
    {
      g_usart3_tx_rcnt = USART3_LINE + 1;
    }
  }
  return current;
}/*}}}*/
static void sim800_get_data(char * data)/*{{{*/
{
  uint16_t k = 0;
  char current = '\0';
  do
  {
    current = sim800_get_char();
    if(current != '\0')
    {
      data[k++] = current;
    }
  } while(current != '\n');
  data[k] = '\0';
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
  do
  {
    print("%s",sim800_at_response(at_response));
  } while((string_cmp(at_response,response) != 0) && (at_response[0] != '\0'));
  return at_response[0] == '\0' ? SIM800_RESPONSE_TIMEOUT : SIM800_RESPONSE_OK;
}/*}}}*/

uint8_t sim800_call(char * number, uint8_t action)/*{{{*/
{
  if(action == SIM800_CALL)
  {
    sim800_at("AT+CREG?");
    if(sim800_wait_for_response("OK\r\n") == SIM800_RESPONSE_OK)
    {
      char cmd[50];
      prints(cmd,"ATD%s;",number);
      sim800_at(cmd);
      sim800_wait_for_response("OK\r\n");
    }
  }
  else
  {
    sim800_at("ATH");
    sim800_wait_for_response("OK\r\n");
  }
}/*}}}*/
uint8_t sim800_sms(char * number, char * message)/*{{{*/
{
  char * cmd[3][2] = {{"AT+CREG?","OK\r\n"},
    {"AT+CMGF=1","OK\r\n"},
    {"AT+CSCS=\"GSM\"","OK\r\n"}
  };
  /* sim800_at("ATE0"); */
  /* print("%s",sim800_at_rx_data(2)); */
  uint8_t status = SIM800_RESPONSE_OK;
  uint8_t k = 0;
  for( k = 0; k < 3; ++k ) 
  {
    if(status == SIM800_RESPONSE_OK)
    {
      sim800_at(cmd[k][0]);
      status = sim800_wait_for_response(cmd[k][1]);
    }
  }
  if (status == SIM800_RESPONSE_OK)
  {
    char cmd[50];
    prints(cmd,"AT+CMGS=\"%s\"\n",number);
    sim800_tx_string(cmd);
    print("%s\n",cmd);
    uint8_t timeout = 255;
    while((sim800_get_char() != '>') && timeout)
    {
      --timeout;
      delay_ms(2);
    }
    sim800_tx_string(message);
    sim800_usart_tx_byte(0x1a);
    delay_ms(2000);
    status = sim800_wait_for_response("OK\r\n");
  }
  return status;
}/*}}}*/
uint8_t sim800_ussd(char * ussd)/*{{{*/
{
  uint8_t status = SIM800_RESPONSE_OK;
  sim800_at("AT+CSCS=\"GSM\"");
  status = sim800_wait_for_response("OK\r\n");
  if (status == SIM800_RESPONSE_OK)
  {
    char cmd[50];
    prints(cmd,"AT+CUSD=1,\"%s\",15",ussd);
    sim800_at(cmd);
    status = sim800_wait_for_response("OK\r\n");
    if (status == SIM800_RESPONSE_OK)
    {
      char ussd_response[100];
      sim800_get_data(ussd_response);
      sim800_get_data(ussd_response);
      print("%s",ussd_response);
    }
  }
  sim800_buffer_flush();
  return status;
}/*}}}*/
uint8_t sim800_http(uint8_t request,char * site,uint8_t * data,uint16_t cnt)/*{{{*/
{
  char cmd[50];
  uint8_t status = SIM800_RESPONSE_OK;
  sim800_at("AT+SAPBR=3,1,\"APN\",\"active.bhmobile.ba\"");
  sim800_wait_for_response("OK\r\n");
  /* print("%s",sim800_at_rx_data(2)); */
  sim800_at("AT+SAPBR=1,1");
  sim800_wait_for_response("OK\r\n");
  /* print("%s",sim800_at_rx_data(2)); */

  status == SIM800_RESPONSE_OK ? sim800_at("AT+HTTPINIT") : 0; 
  status = sim800_wait_for_response("OK\r\n"); 
  status == SIM800_RESPONSE_OK ? sim800_at("AT+HTTPPARA=\"CID\",1") : 0; 
  status = sim800_wait_for_response("OK\r\n"); 
  prints(cmd,"AT+HTTPPARA=\"URL\",\"%s\"",site);
  status == SIM800_RESPONSE_OK ? sim800_at(cmd) : 0;
  status = sim800_wait_for_response("OK\r\n"); 
  if((request == SIM800_HTTP_GET) && (status == SIM800_RESPONSE_OK ))
  {
    char line[100];
    uint8_t argc = 0;
    char * argv[5];
    sim800_at("AT+HTTPACTION=0");
    sim800_wait_for_response("OK\r\n");
    sim800_get_data(line);
    sim800_get_data(line);
    string_split(line,&argc,argv," :,");
    uint8_t j = 0;
    for (j = 0; j < argc; ++j)
    {
      print("%s\n",argv[j]);
    }
    if(string_cmp("200",argv[2]) == 0)
    {
      prints(cmd,"AT+HTTPREAD=0,%s",argv[3]);
      sim800_at(cmd);
      do
      {
        sim800_get_data(line);
        print("%s",line);
        string_split(line,&argc,argv," :,");
      } while(string_cmp("+HTTPREAD",argv[0]) != 0);
      sim800_get_data(line);
      string_cpy(data,line);
      //TODO: READ LINES AND STORE THEM IN BUFFER UNTIL OK
      //IS REACHED(Apparantly this is working)
      //
      sim800_wait_for_response("OK\r\n");
    }
    else
    {
      status = SIM800_RESPONSE_TIMEOUT;
    }
  }
  else if((request == SIM800_HTTP_POST) && (status == SIM800_RESPONSE_OK ))
  {
    char line[100];
    uint8_t argc = 0;
    char * argv[5];
    sim800_at("AT+HTTPDATA=1000,5000");
    status = sim800_wait_for_response("DOWNLOAD\r\n"); 
    print("%s\n",data);
    sim800_tx_string(data);
    do
    {
      sim800_get_data(line);
      print("%s",line);
      string_split(line,&argc,argv," :,");
    } while(string_cmp("OK\r\n",argv[0]) != 0);
    status == SIM800_RESPONSE_OK ? sim800_at("AT+HTTPACTION=1") : 0;
    status = sim800_wait_for_response("OK\r\n"); 
    do
    {
      sim800_get_data(line);
      print("%s",line);
      string_split(line,&argc,argv," :,");
    } while((string_cmp("+HTTPACTION",argv[0]) != 0) && (status == SIM800_RESPONSE_OK));
  }
  else
  {
    //head
  }
  sim800_at("AT+HTTPTERM");
  sim800_wait_for_response("OK\r\n");
  return status;
}/*}}}*/
