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
M=D				// set addr to SCREEN's base array address

@KBD
D=M
@KEYPRESSED
D;JNE			// execute KEYPRESSED() function if kbd reads nonzero
@NOINPUT
D;JEQ

(KEYPRESSED)	// fill screen with black pixels when any key is pressed

// this snippet sets the screen word to 32 or 100000
// @32
// D=A
// @n
// M=D			// testing turning "off" the 7th bit

@addr
A=M
M=-1 			// -1 is 2^16-1, or all 1's. use D if we want to uncomment above code
@LOOP
0;JMP

(NOINPUT)		// no keyboard input means we want all pixels white
@addr
A=M
M=0				
@LOOP
0;JMP