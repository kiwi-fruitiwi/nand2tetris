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


(INPUTLOOP)
	@KBD
	D=M
	@KEYPRESSED
	D;JNE		// execute KEYPRESSED() function if kbd reads nonzero
	@NOINPUT	// execute NOINPUT() function if... 
	D;JEQ		// kbd reads zero

	// both KEYPRESSED and NOINPUT loop back


// keyboard input means we set our screen to a pattern. set pattern, goto DRAW()
(KEYPRESSED)	// fill screen with black pixels (our pattern) when any key is pressed
	@pattern
	M=-1 		// set 16-bit word to all 1's via two's complement
	@DRAW		// hop over to DRAW() function
	0;JMP		

	// optionally, we could load any value into the pattern variable
	// @31
	// D=A
	// @pattern
	// M=D 		// pattern = 31


// no keyboard input means we want all pixels white; set pattern, goto DRAW()
(NOINPUT)		
	@pattern
	M=0				
	@DRAW
	0;JMP		// pattern = 0


// set every word in SCREEN memory to value of pattern
(DRAW)
	@8191
	D=A
	@i
	M=D			// set our position / counter variable to 8191
	
	(DRAWLOOP)
		@i
		D=M
		@INPUTLOOP
		D;JLT // if i < 0, goto INPUTLOOP

		// pos = i + SCREEN; pos is the position within the screen
		// there are 8192 16-bit values in the SCREEN portion of RAM
		// from 0 to 8191
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

		@DRAWLOOP
		0;JMP



// the entire program is an infinite loop waiting on keyboard input