// try to make the entire display black
// TODO: use a variable to store -1 or 0 for black vs white
//			this will prevent us from duplicating the loop!



// pattern=R0
@R0
D=M		// D=R0's address
@pattern
M=D		// RAM[A]=D=R0, i.e. pattern=R0


// i=8192
@8192	
D=A		// register D=8192
@i
M=D		// i=8192


// set every word in SCREEN memory to value of pattern
(LOOP)
	@i
	D=M
	@END
	D;JLT // if i < 0, goto END


	// pos = i + SCREEN; pos is the position within the screen
	// there are 8192 16-bit values in the SCREEN portion of RAM
	@SCREEN
	D=D+A 		// D ⭠ SCREEN's address + i
	@pos
	M=D

	// RAM[SCREEN+i] = pattern
	@pattern
	D=M
	@pos
	A=M			// A ⭠ value of pos
	M=D			// RAM[SCREEN+i] = pattern

	// i--
	@i
	M=M-1 // decrement i every time we loop

	@LOOP
	0;JMP

(END)
	@END
	0;JMP