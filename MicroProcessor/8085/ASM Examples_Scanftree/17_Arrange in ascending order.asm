http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Arrange in ascending order
Statement: Write a program to sort given 10 numbers from memory location 2200H in the ascending order.

    MVI B, 09      :"Initialize counter"     
    START          :"LXI H, 2200H: Initialize memory pointer"
    MVI C, 09H     :"Initialize counter 2"
    BACK: MOV A, M :"Get the number"
    INX H          :"Increment memory pointer"
    CMP M          :"Compare number with next number"
    JC SKIP        :"If less, don’t interchange"
    JZ SKIP        :"If equal, don’t interchange"
    MOV D, M
    MOV M, A
    DCX H
    MOV M, D
    INX H          :"Interchange two numbers"
    SKIP:DCR C     :"Decrement counter 2"
    JNZ BACK       :"If not zero, repeat"
    DCR B          :"Decrement counter 1"
    JNZ START
    HLT            :"Terminate program execution"