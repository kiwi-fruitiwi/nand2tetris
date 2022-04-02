// turns the entire screen black
// @SCREEN is 16384-24575
// @KBD is 24576
// so screen memory is in the range [16384, 24575] +8191
// 
// 
// 
// 
// 

@i
M=0

(LOOP)
  @SCREEN
  D=A
  @i
  D=D+M
  A=D
  M=-1

  @i
  M=M+1

  @8192
  D=A
  @i
  D=M-D
  @LOOP
  D;JLT

(END)
  @END
  0;JMP