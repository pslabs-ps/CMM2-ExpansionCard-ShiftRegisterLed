'MMEDIT!!! Basic Version = CMM2
'MMEDIT!!! Port = COM13:115200:10,300
'MMEDIT!!! Device = CMM2
SETPIN 31, DOUT 'set pin 31 to latch the chip
SPI OPEN 195315, 0, 16 'open spi: speed, mode 0, data size is 16 bits

junk = SPI(&B00) 'send the command and ignore the return

'this is latching and unlatching shift register chip, just in case
PIN(31) = 1
PIN(31) = 0

Do
cnt = 1              'seed cnt with 1
  Do While cnt<65536 'loop range for 16 bit value
    PIN(31) = 0      'unlatch shift register
    junk = SPI(cnt)  'send the command and ignore the return
    PIN(31) = 1      'latch register
    cnt=cnt<<1       'shift 1 in cnt
    PAUSE 100        'pause
  Loop
Loop

SPI CLOSE 'close SPI