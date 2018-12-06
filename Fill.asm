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
(RESTART)
@SCREEN //start the screen
D=A
@0 //screen start is lodged at RAM0
M=D

@KBD
D=M
@BLACK
D;JGT //jump if any kbd keys are being pressed, display black
@WHITE
D;JEQ //if any kbd are not pressed, display white

@KBD
0;JMP
(BLACK)
@1
M=-1 //fill screen with m=-1, all black
@CHANGE
0;JMP
(WHITE)
@1
M=0 //fill screen with m=0, all white
@CHANGE
0;JMP

@1 
D=M // look in RAM1 to see if the screen is black or white

@0
A=M //find the address of the pixel about to be filled
M=D //display on that pixel whatever is inside RAM0 

@0 
D=M+1 //moving over to the next pixel
@KBD
D=A-D //whatever was displayed on the previous pixel, display the same color

@0
M=M+1 //move over to the next pixel, display the same color
A=M

@CHANGE 
0;JGT //if the whole screen is black (a=0), exit the program
@RESTART
0;JMP //otherwise restart
