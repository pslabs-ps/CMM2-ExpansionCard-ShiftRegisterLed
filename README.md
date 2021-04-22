# CMM2-ExpansionCard-ShiftRegisterLed
 helps to learn how shift registers work, 16 led operated from 3 pins, can be daisy chained

Schematic can be found here: [schematic REV A v02](/Schematic/shift_led_REVA_v01.pdf)

Expansion system and cards can be purchased here: [PS Labs](https://sklep.pslabs.pl/Maximite-c91)

<img src="Images/exp_items.png" width="800">

1. Power supply selector
2. Card configurator
3. Card configurator
4. Shift registers
5. 16 LED

# WARNING!
<img src="Images/champf.jpg" width="200">
Expansion card used with this system have to have edges chamfered, using unchamfered card will result in slot damage.

# Assembly
1. Cut goldpin headers with pliers to correct length and install
2. Install jumpers
 
# Shift register LED card sample code
<img src="Images/example1.png" width="800">
For purpuse of this code, card should be confugured as follows:
1. J6 power selector jumper set to 3V3 SY
2. Connect MOSI to pin 19
3. Connect SCK to pin 23
4. Connect LATCH to CS1
5. Connect CS1 (chip sellect 1) to GND
6. Connect CS2 (chip sellect 2) to GND
 
```basic
SETPIN 31, DOUT 'set pin 31 to latch the chip
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
```