#include "cstring.h"
#include "print.h"

#define MAX_ARGS                        50 
static char * g_destination;
static uint16_t g_cnt;

/*{{{ Private*/
static void string_tx_byte(uint8_t data)/*{{{*/
{
  g_destination[g_cnt++] = data;
}/*}}}*/
/*}}}*/
/*{{{ Public*/
char * prints(char * destination,char * str, ...)/*{{{*/
{
  char ch;
  uint8_t base = 0;
  uint8_t width = 0;
  int number = 0;
  uint8_t status = 0x00;

  void (*send_char)(uint8_t) = print_get_tx_function();
  print_init(string_tx_byte);
  g_destination = destination;
  g_cnt = 0;

  va_list vl;
  va_start(vl,str);
  while(1)  
  {
    //print character
    while((ch = *str++) != '%')
    {
      if(ch == '\0') // test for end of string
      {
        status = 0x01;
        break; 
      }
      /* if(ch == '\n') */
      /* { */
        /* string_tx_byte('\r'); */
      /* } */
      string_tx_byte(ch);
    }
    if(status)
    {
      //reached end of string
      break;
    }
    switch(ch = *str++)
    {
      case 'c':
        {
          char tx_char = va_arg(vl,int);
          string_tx_byte(tx_char);
          break;
        }
      case 's':
        sprint((uint8_t * )va_arg(vl,char *));
        break;
      case 'd':
        base = 10;
        width = 0;
        number = va_arg(vl,int);
        if(number < 0)
        {
          string_tx_byte('-');
          number *= (-1);
        }
        print_number(number,base,width);
        break;
      case 'b':
        base = 2;
        width = number_width(&str);
        number = va_arg(vl,int);
        string_tx_byte('0');
        string_tx_byte('b');
        print_number(number,base,width);
        break;
      case 'x':
        base = 16;
        width = number_width(&str);
        number = va_arg(vl,int);
        string_tx_byte('0');
        string_tx_byte('x');
        print_number(number,base,width);
        break;
      case 'f':
        {
          base = 10;
          width = 0;
          double re_num = va_arg(vl,double);
          number = re_num;
          int32_t fractional = (re_num - number)*1000; 
          if(re_num< 0)
          {
            string_tx_byte('-');
            number *= (-1);
            fractional *= (-1);
          }
          print_number(number,base,width);
          string_tx_byte('.');
          print_number(fractional,base,3);
        }
        break;
      default:
        string_tx_byte(ch);
        break;
    }
  }
  g_destination[g_cnt] = '\0';
  va_end(vl);
  print_init(send_char);
  return g_destination;
}/*}}}*/
int8_t string_cmp(const char * lhs, const char * rhs)/*{{{*/
{
  while((*lhs != '\0') && (*lhs == *rhs))
  {
    ++lhs;
    ++rhs;
  }
  int8_t status = *lhs < *rhs ? -1 : *lhs > *rhs;
  return status;
}/*}}}*/
char * string_cpy(char * lhs, const char * rhs)/*{{{*/
{
  uint8_t k = 0;
  while (rhs[k] != '\0')
  {
    lhs[k] = rhs[k];
    ++k;
  }
  lhs[k] = '\0';
  return lhs;
}/*}}}*/
uint8_t string_split(char * line, uint8_t * argc, char * argv[],char * delimiter)/*{{{*/
{
  uint8_t k = 0;
  *argc = 0;
  if(*line != '\0')
  {
    argv[(*argc)++] = line;
  }
  while(*line != '\0')
  {
    if(*argc >= MAX_ARGS)
    {
      return 0x01;
    }
    k = 0;
    while(delimiter[k] != '\0')
    {
      if(*line == delimiter[k])
      {
        *line = ' ';
      }
      k++;
    }
    if (*line == ' ')
    {
      while(*line == ' ')
      {
        *line++ = '\0';
      }
      if(*line != '\0')
      {
        argv[(*argc)++] = line;
      }
      continue;
    }
    ++line;
  }
  return 0;
}/*}}}*/

uint32_t string_to_number(char * str)/*{{{*/
{
  uint32_t number = 0;
  uint8_t k = 0;
  while ((str[k] != '\0') && (str[k] != '\r') && (str[k] != '\n'))
  {
    number = (number * 10) + (str[k++] - '0');
  }
  return number;
}/*}}}*/
/*}}}*/
