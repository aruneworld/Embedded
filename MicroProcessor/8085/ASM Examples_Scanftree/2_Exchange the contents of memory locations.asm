http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Exchange the contents of memory locations

Statement: Exchange the contents of memory locations 2000H and 4000H.

    Program 1: 
    LDA 2000H   : "Get the contents of memory location 2000H into accumulator"
    MOV B, A    : "Save the contents into B register"
    LDA 4000H   : "Get the contents of memory location 4000Hinto accumulator"
    STA 2000H   : "Store the contents of accumulator at address 2000H"
    MOV A, B    : "Get the saved contents back into A register"
    STA 4000H   : "Store the contents of accumulator at address 4000H"

    Program 2:
    LXI H 2000H : "Initialize HL register pair as a pointer to memory location 2000H."
    LXI D 4000H : "Initialize DE register pair as a pointer to memory location 4000H."
    MOV B, M    : "Get the contents of memory location 2000H into B register."
    LDAX D      : "Get the contents of memory location 4000H into A register."
    MOV M, A    : "Store the contents of A register into memory location 2000H."
    MOV A, B    : "Copy the contents of B register into accumulator."
    STAX D      : "Store the contents of A register into memory location 4000H."
    HLT         : "Terminate program execution."

Note: In Program 1, direct addressing instructions are used, whereas in Program 2, indirect addressing instructions are used.
