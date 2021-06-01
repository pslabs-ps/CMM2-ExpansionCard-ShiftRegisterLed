'MMEDIT!!! Basic Version = CMM2
'MMEDIT!!! Port = COM13:115200:10,300
'MMEDIT!!! Device = CMM2
SETPIN 31, DOUT 'set pin 31 to latch the shift register chip
SPI OPEN 195315, 0, 16 'mode 0, data size is 16 bits
  
  
  'set valuses for each card to be send
  CARD1 = &B111011111011111
  CARD2 = &B100010101010101
  CARD3 = &B100000101010101
  CARD4 = &B111000101010101


  PIN(31) = 0 'set low latching pin
  
  'send values via SPI
  junk = SPI(CARD1)
  junk = SPI(CARD2)
  junk = SPI(CARD3)
  junk = SPI(CARD4)
  
  PIN(31) = 1 'set latching pin high to turn on register output
	
SPI CLOSE