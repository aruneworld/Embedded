http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Add contents of two memory locations
Statement: Add the contents of memory locations 4000H and 4001H and place the result in the memory locations 4002Hand 4003H.

    Sample problem:
    (4000H) = 7FH
    (400lH)  = 89H
             Result    = 7FH + 89H = lO8H
    (4002H) = 08H
    (4003H) = 0lH
    Source program: 
    LXI H, 4000H  : "HL Points 4000H"
    MOV A, M      : "Get first operand"
    INX H         : "HL Points 4001H"
    ADD M         : "Add second operand"
    INX H         : "HL Points 4002H"
    MOV M, A      : "Store the lower byte of result at 4002H"
    MVIA, 00      : "Initialize higher byte result with 00H"
    ADC A         : "Add carry in the high byte result"
    INX H         : "HL Points 4003H"
    MOV M, A      : "Store the higher byte of result at 4003H"
    HLT           : "Terminate program execution"