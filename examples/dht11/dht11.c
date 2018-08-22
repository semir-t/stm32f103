#include "dht11.h"

#define DHT11_PIN					        0x0001								 
#define DHT11_PIN_LOW             GPIOA->ODR &= ~(DHT11_PIN)
#define DHT11_PIN_HIGH            GPIOA->ODR |= (DHT11_PIN)
#define DHT11_PIN_READ            (GPIOA->IDR & DHT11_PIN)

/*{{{ Private*/
static void dht11_pin_input(void)/*{{{*/
{
  GPIOA->CRL &= ~(0x0000000f);  // clean default value (0x44444444) 
  GPIOA->CRL |= 0x00000008;     // set pin A0 as input and enable pull-up 
  GPIOA->ODR = 0x0001;          // set pull-up
}/*}}}*/
static void dht11_pin_output(void)/*{{{*/
{

  GPIOA->CRL &= ~(0x0000000f);  // clean default value (0x44444444) 
  GPIOA->CRL |= 0x00000003;     // set A0 as output, push-pull
  GPIOA->ODR = 0x0001;
}/*}}}*/
/*}}}*/
/*{{{ Public*/
void dht11_init(void)/*{{{*/
{
  RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;                   // enable clock for port GPIOA
  dht11_pin_input();
  delay_ms(2000);
}/*}}}*/
uint8_t dht11_read(uint8_t * data)/*{{{*/
{
	uint32_t time;
	uint32_t time_bits[41];
	uint8_t k, n, m;
  uint8_t timeout = DHT11_TIMEOUT;
	
	// clear data buffer
	for(k=0;k<5;k++)
  {
		data[k] = 0x00;
  }

	
  dht11_pin_output();
	// generate start condition
  DHT11_PIN_LOW;								// set low state for at least 18 ms
	delay_ms(20);
	
  DHT11_PIN_HIGH;								// set low state for at least 18 ms
	delay_us(20);
	
  dht11_pin_input();
	// wait for response
  while(DHT11_PIN_READ && (timeout--))
  {
    delay_us(1);
    // wait for high to low transition
  }
  timeout = timeout == 0 ? 0 : DHT11_TIMEOUT;
  while(!DHT11_PIN_READ && (timeout--))
  {
    delay_us(1);
    // wait for low to high transition 
  }
  timeout = timeout == 0 ? 0 : DHT11_TIMEOUT;

  // read the data from DHT11
  while(DHT11_PIN_READ && (timeout--))
  {
    delay_us(1);
    // wait for low
  }
  timeout = timeout == 0 ? 0 : DHT11_TIMEOUT;
  time = 0; 
  for (k=0; (k<40) && timeout;k++)
  {
    // wait for high
    while(!DHT11_PIN_READ && (timeout--))
    {
      delay_us(1);
    }
    timeout = timeout == 0 ? 0 : DHT11_TIMEOUT;
    time = 0;
    while(DHT11_PIN_READ && (timeout--))
    {
      delay_us(1);
      ++time;
    }
    time_bits[k] = time * 2;
    timeout = timeout == 0 ? 0 : DHT11_TIMEOUT;
  }

  // decode time periods into bits for actual data
  m = 0;
  for(k=0;k<5;k++)
  {
    data[k] = 0x00;
    for(n=0;n<8;n++)
    {
      data[k] = data[k]<<1;
      if(time_bits[m] > 50)
      {
        data[k] |= 0x01;
      }
      m++;
    }
  }

  return timeout ? DHT11_E_OK : DHT11_E_TIMEOUT;
}/*}}}*/
uint8_t dht11_read_temperature(uint8_t * data)/*{{{*/
{
  uint8_t raw_data[5];
  uint8_t status = dht11_read(raw_data);
  data[0] = raw_data[DHT11_TEMP_DEC];
  data[1] = raw_data[DHT11_TEMP_FRAC];
  return status;
}/*}}}*/
uint8_t dht11_read_humidity(uint8_t * data)/*{{{*/
{
  uint8_t raw_data[5];
  uint8_t status = dht11_read(raw_data);
  data[0] = raw_data[DHT11_HUM_DEC];
  data[1] = raw_data[DHT11_HUM_FRAC];
  return status;
}/*}}}*/
/*}}}*/
