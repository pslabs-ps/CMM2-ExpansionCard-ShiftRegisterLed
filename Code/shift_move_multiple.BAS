'MMEDIT!!! Basic Version = CMM2
'MMEDIT!!! Port = COM13:115200:10,300
'MMEDIT!!! Device = CMM2
  SETPIN 31, DOUT 'set pin 32 to latch the chip
  SPI OPEN 195315, 0, 8 'mode 0, data size is 16 bits
  
  shiftno = 8 'number of shift registers(each card has 2 shift registers)
  
  DIM tosend(shiftno-1)
  DIM cnt = 1
  DIM cnt2 = 0
  
  
SUB ShiftSend c
  PIN(31) = 0
  For i=0 to c-1
    junk = SPI(tosend(i)) ' send the command and ignore the return
    PRINT tosend(i)
  NEXT i
  PIN(31) = 1
END SUB
  
  
SUB ShiftArray c
  
  if tosend(cnt2)<128 THEN
    tosend(cnt2)=tosend(cnt2)<<1
  ELSE
    PRINT "else"
    cnt=1
    tosend(cnt2)=0
    cnt2=cnt2+1
    IF cnt2 > shiftno-1 THEN cnt2 = 0
    tosend(cnt2)=1 'seed next value in array
  END IF
  
END SUB
  
  
'ShiftSend(shiftno)
tosend(cnt2)=1 'iniciate array with value to shift

  Do
    
    
    
    ShiftArray(cnt2)
    ShiftSend(shiftno)
    PAUSE 100
  
  Loop
  
  SPI CLOSE