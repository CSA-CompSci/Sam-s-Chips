// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@2 //location of final answer
M=0 //make sure it is cleared 

@0 
D=M
@END
D;JEQ //jump if one product equals zero

@1
D=M
@END
D;JEQ //jump if one product equals zero

@0
D=M
@3
M=D //only keep the numbers being multiplied, store in RAM3

(LOOP)
@1 //look at the second number
D=M //allow d to hold it 

@2
M=D+M //second number is now stored at RAM2 as final answer

@3 //look at the first number
M=M-1 //subtract 1 away from the first number

D=M-1 
@LOOP
M;JGT //repeat the multiplication and subtraction forever until

(END)
@END
0;JMP //jump to end program when equal to 0
