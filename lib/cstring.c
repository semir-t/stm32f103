#include "cstring.h"
#include "print.h"

#define STRING_SIZE                     256
volatile char g_string[STRING_SIZE];
volatile uint8_t g_cnt;

/*{{{ Private*/
static void string_tx_byte(uint8_t data)/*{{{*/
{
  if(g_cnt < STRING_SIZE)
  {
    g_string[g_cnt++] = data;
  }
}/*}}}*/
/*}}}*/
/*{{{ Public*/
char * prints(char * str, ...)/*{{{*/
{
  char ch;
  uint8_t base = 0;
  uint8_t width = 0;
  int number = 0;
  uint8_t status = 0x00;

  void (*send_char)(uint8_t) = print_get_tx_function();
  print_init(string_tx_byte);
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
      send_char(ch);
      /* if(ch == '\n') */
      /* { */
      /* send_char('\r'); */
      /* } */
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
          send_char(tx_char);
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
          send_char('-');
          number *= (-1);
        }
        print_number(number,base,width);
        break;
      case 'b':
        base = 2;
        width = number_width(&str);
        number = va_arg(vl,int);
        send_char('0');
        send_char('b');
        print_number(number,base,width);
        break;
      case 'x':
        base = 16;
        width = number_width(&str);
        number = va_arg(vl,int);
        send_char('0');
        send_char('x');
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
            send_char('-');
            number *= (-1);
            fractional *= (-1);
          }
          print_number(number,base,width);
          send_char('.');
          print_number(fractional,base,3);
        }
        break;
      default:
        send_char(ch);
        break;
    }
  }
  g_string[g_cnt] = '\0';
  va_end(vl);
  print_init(send_char);
  return g_string;
}/*}}}*/
/*}}}*/
