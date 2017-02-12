http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Alter the contents of flag register in 8085
Statement: Write a set of instructions to alter the contents of flag register in 8085.

    PUSH PSW  : "Save flags on stack"
    POP H     : "Retrieve flags in ‘L’"
    MOV A, L  : "Flags in accumulator"
    CMA       : "Complement accumulator"
    MOV L, A  : "Accumulator in ‘L’"
    PUSH H    : "Save on stack"
    POP PSW   : "Back to flag register"
    HLT       : "Terminate program execution"