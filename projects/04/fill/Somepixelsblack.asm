


















// try to make one word of pixels on the screen black at some offset

@24	
D=A		// register D=8192
@i
M=D		// i=8192

// set first 16 pixels black
// (LOOP)

D=M // assign D to i
@SCREEN
D=D+A
A=D
M=-1

// @LOOP
// 0;JMP

(END)
@END
0;JMP