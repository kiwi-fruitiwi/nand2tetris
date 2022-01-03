// Program: Rectangle.asm
// Draws a filled rectangle at the screen's top left corner,
// with width of 16 pixels and height of RAM[0] pixels.
// Usage: put a non-negative number (height) in RAM[0]


@SCREEN
D=A			// D=24576
@addr
M=D			// set addr variable to base screen array

@0
D=M			// D=RAM[0]
@n
M=D			// n=RAM[0]

@i
M=0			// i=0

(LOOP)
	@i
	D=M
	@n
	D=D-M
	@END
	D;JGT		// if i>n, goto END

	@addr
	A=M			// A=RAM[A]=addr
	M=-1		// RAM[addr]=-1=11111111111111

	@i
	M=M+1		// i=i+1
	@32
	D=A
	@addr
	M=D+M
	@LOOP
	0;JMP

(END)
	@END
	0;JMP