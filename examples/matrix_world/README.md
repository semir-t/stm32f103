## About
Library for controlling 8x8 LED matrix display based on MAX7219.

Idea was to make library that is easily portable to other MCUs.
This is achieved using macros defined in max7219.h under the section
'SPI CORE'. For this drive to work in is necessary to define macro/function
which sets/resets state of the slave select (SS) pin. Also, functions for
initialization of SPI and for sending one byte of data via SPI must
be associated with the appropriate macros.

This library uses hardware SPI, and this code is fully tested and working.
Library contains some parts of the code which are intended for software
SPI, and this code was working on Atmels MCUs. But latest changes to the
code made for the purpose of making the library more portable made it
easier to use hardware or software SPI. But this still has to be implemented
and tested.

First function to call is the initialization function
max7219_init(...) which takes the argument for setting the
prescaler. With this argument we set the prescaler for the
hardware SPI.

For printing the text there is a dedicated function.
This function shifts data on the display creating
the animation of the moving text. This is implemented
not by moving data in the buffer, but with the incrementing
rx_cnt and tx_cnt values. This way our program is faster and uses less
memory.


##NOTE:
  Next step is to implement transfer of the data to the display via DMA.

## Release History
  * 1.1
  ** Library is easily portable to other MCUs
  * 1.0
  ** The first proper release


## Meta

  Semir Tursunovic – tursunovic.semir@gmail.com


