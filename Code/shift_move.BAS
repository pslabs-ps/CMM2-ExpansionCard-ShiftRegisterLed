SETPIN 31, DOUT 'set pin 32 to latch the chip
SPI OPEN 195315, 0, 16 'mode 0, data size is 16 bits

junk = SPI(&B00) ' send the command and ignore the return
PIN(31) = 1
PIN(31) = 0

Do
cnt = 1
Do While cnt<65536
  junk = SPI(cnt) ' send the command and ignore the return
  PIN(31) = 1
  PIN(31) = 0
  cnt=cnt<<1
  'PRINT cnt
  PAUSE 100
Loop
Loop

SPI CLOSE 
