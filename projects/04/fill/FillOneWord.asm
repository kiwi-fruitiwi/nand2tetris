// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
	@SCREEN
	D=A
	@addr
	M=D			// set addr to SCREEN's base array address

	@KBD
	D=M
	@KEYPRESSED
	D;JNE		// execute KEYPRESSED() function if kbd reads nonzero
	@NOINPUT	// execute NOINPUT() function if kbd reads zero
	D;JEQ

	// both KEYPRESSED and NOINPUT loop back


// set pixels black
(KEYPRESSED)	// fill screen with black pixels when any key is pressed
	@addr
	A=M
	M=-1 		// set 16-bit word to all 1's via two's complement
	@LOOP
	0;JMP			


// no keyboard input means we want all pixels white
(NOINPUT)		
	@addr
	A=M
	M=0				
	@LOOP
	0;JMP