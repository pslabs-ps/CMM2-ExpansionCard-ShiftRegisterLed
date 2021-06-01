'MMEDIT!!! Basic Version = CMM2
'MMEDIT!!! Port = COM13:115200:10,300
'MMEDIT!!! Device = CMM2
SETPIN 31, DOUT 'set pin 31 to latch the chip
SPI OPEN 195315, 0, 16 'mode 0, data size is 16 bits
  
  
  
  LED1 = &B111011111011111
  LED2 = &B100010101010101
  LED3 = &B100000101010101
  LED4 = &B111000101010101


  PIN(31) = 0
  
  junk = SPI(LED1)
  junk = SPI(LED2)
  junk = SPI(LED3)
  junk = SPI(LED4)
  
  PIN(31) = 1
	
SPI CLOSE