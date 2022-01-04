// to set the first 16 pixels black, you can use these two lines:
// @SCREEN
// M=-1

// try to make one word of pixels on the screen black at some offset

@24	
D=A		// register D=8192
@i
M=D		// i=8192

// set first 16 pixels black
// (LOOP)

D=M // assign D to i
@SCREEN
D=D+A // D=A+1 if we want the offset to be just 1!
A=D
M=-1

// @LOOP
// 0;JMP

(END)
@END
0;JMP