http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Add two decimal numbers of 6 digit each
Statement: Two decimal numbers six digits each, are stored in BCD package form. Each number occupies a sequence of byte in the memory. The starting address of first number is 6000H Write an assembly language program that adds these two numbers and stores the sum in the same format starting from memory location 6200H.

    LXI H, 6000H    :"Initialize pointer l to first number"
    LXI D, 6l00H    :"Initialize pointer2 to second number"
    LXI B, 6200H    :"Initialize pointer3 to result"
    STC
    CMC             :"Carry = 0"
    BACK: LDAX D    :"Get the digit"
    ADD M           :"Add two digits"
    DAA             :"Adjust for decimal"
    STAX.B          :"Store the result"
    INX H           :"Increment pointer 1"
    INX D           :"Increment pointer2"
    INX B           :"Increment result pointer"
    MOV A, L
    CPI 06H         :"Check for last digit"
    JNZ BACK        :"If not last digit repeat"
    HLT             :"Terminate program execution"