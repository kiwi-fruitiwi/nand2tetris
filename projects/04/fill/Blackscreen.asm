// try to make the entire display black
// TODO: use a variable to store -1 or 0 for black vs white
//			this will prevent us from duplicating the loop!

@8192	
D=A		// register D=8192
@i
M=D		// i=8192


(LOOP)
	@i
	D=M
	@END
	D;JLT // if i < 0, goto END

	@i
	M=M-1 // decrement i every time we loop

	@SCREEN
	D=D+A // D=SCREEN+i. note that these are addresses
	A=D
	M=-1 // set this screen RAM word to make 16 black pixels

	@LOOP
	0;JMP

(END)
	@END
	0;JMP