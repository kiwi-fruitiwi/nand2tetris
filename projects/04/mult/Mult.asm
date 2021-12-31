// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.


// start by assigning variables:
// n=R0
// i=0
// sum=0
@R0
D=M
@n
M=D
@i
M=0
@sum
M=0

// this is our loop
(LOOP)
@i
D=M 		// assign i to D
@R1
D=D-M 		// D = i-R1
@STOP
D;JGE 		// if i>=R1, goto STOP. JGE checks if i-R1>=0, or i>=R1

// calculate sum += i
@sum
D=M
@n
D=M+D 		// sum + n
@sum
M=D 		// sum += n

// i++
@i
M=M+1

// loop
@LOOP
0;JMP

(STOP)
@sum
D=M
@R2
M=D

(END)
@END
0,JMP