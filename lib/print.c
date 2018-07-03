#include "print.h"

void (*send_char)(uint8_t) = 0;

void print_init(void (*usart_tx_byte)(uint8_t))/*{{{*/
{
  send_char = usart_tx_byte;
  return;
}/*}}}*/
uint8_t number_width(char ** str)/*{{{*/
{
  char ch = *(*str);
  uint8_t width = 0;
  switch(ch)
  {
    case 'b':
      width = 8;
      ++(*str);
      break;
    case 'h':
      width = 16;
      ++(*str);
      break;
    case 'w':
      ++(*str);
    default: // default is actually case 'w' so no need for break
      width = 32;
      break;
  }
  return width;
}/*}}}*/
void print_number(int num,uint8_t base,uint8_t width)/*{{{*/
{ 
  char ch;
  uint8_t k = 0;
  uint32_t bit_mask;
  uint8_t temp_rez;

  switch(base)
  {
    case 10:
      {
        k = 1;
        bit_mask = 0x0A;
        while((num / bit_mask) >= 1) // get number of digits
        {
          ++k;
          bit_mask *= 10;
        }
        bit_mask /= 10;
        k = width ? width : k;
        bit_mask =  width ? 100 : bit_mask;
        while(k > 0)
        {
          ch = (num / bit_mask);
          num -= bit_mask * ch;
          bit_mask /= 10;
          send_char(ch + 48);
          --k; 
        }
      }
      break;
    case 2:
      bit_mask = 0x01;
      for(k = width; k > 0; --k)
      {
        width -= 1;
        ch = ((num >> width) & bit_mask) == 0 ? '0' : '1';
        send_char(ch);
      }
      break;
    case 16:
      bit_mask = 0xF;
      for (k = ((width / 4) + 1 ); k > 1; k--)
      {
        width -= 4;
        temp_rez = ((num >> width) & bit_mask);
        if (temp_rez < 10)
        {
          ch = temp_rez + 48;
        }
        else
        {
          ch = temp_rez + 65 - 10;
        }
        send_char(ch);
      }
      break;
  }
}/*}}}*/
void print(char * str, ...)/*{{{*/
{
  char ch;
  uint8_t base = 0,width = 0;
  int number = 0;

  va_list vl;
  va_start(vl,str);
  while(1)  
  {
    //print character
    while((ch = *str++) != '%')
    {
      if(ch == '\0') // test for end of string
      {
        return;
      }
      send_char(ch);
      if(ch == '\n')
      {
        send_char('\r');
      }
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
  va_end(vl);
  return;
}/*}}}*/
void sprint(uint8_t * str)/*{{{*/
{
  uint16_t k = 0;
  while (str[k] !='\0')
  {
    send_char(str[k]);
    if(str[k] == '\n')
    {
      send_char('\r');
    }
    ++k;
    if(k == MAX_PRINT_STRING_SIZE)
    {
      break;
    }
  }
}/*}}}*/
