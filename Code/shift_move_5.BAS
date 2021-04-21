SETPIN 31, DOUT 'set pin 32 to latch the chip
SETPIN 33, DOUT '2nd set of 32 bit cards
SPI OPEN 195315, 0, 32 'mode 0, data size is 16 bits

'junk = SPI(&B00) ' send the command and ignore the return
'PIN(31) = 1
PIN(31) = 0
PIN(33) = 0

Do
cnt = 1


junk = SPI(&B00)
PIN(31)=1
PIN(33)=1
PIN(31)=0
PIN(33)=0



Do While cnt<4294967294
'Do
  junk = SPI(cnt) ' send the command and ignore the return
  PIN(31) = 1
  PIN(31) = 0
  cnt=cnt<<1
  'cnt = &b10000000001
  'cnt=1<<cnt
  PRINT cnt
  'PRINT BIN$(cnt)
  PAUSE 20
Loop


junk = SPI(&B00)
PIN(31)=1
PIN(33)=1
PIN(31)=0
PIN(33)=0




cnt = 1
Do While cnt<4294967294
'Do
  junk = SPI(cnt) ' send the command and ignore the return
  PIN(33) = 1
  PIN(33) = 0
  cnt=cnt<<1
  'cnt = &b10000000001
  'cnt=1<<cnt
  PRINT cnt
  'PRINT BIN$(cnt)
  PAUSE 20
Loop




Loop


'SPI WRITE 1, &H80
'byte1 = SPI(0) ' get the first byte from the slave
'byte2 = SPI(0) ' get the second byte from the slave
'PAUSE 10
'PIN(31) = 1 ' deselect the slave
'PAUSE 10
'PIN(31) = 0
'PRINT junk
SPI CLOSE 
