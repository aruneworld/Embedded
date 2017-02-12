http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Pack the unpacked BCD numbers
Statement: Pack the two unpacked BCD numbers stored in memory locations 4200H and 4201H and store result in memory location 4300H. Assume the least significant digit is stored at 4200H.

    Sample problem:
    (4200H) = 04
    (4201H) = 09
    Result = (4300H) = 94
    Source program: 
    LDA 4201H   : "Get the Most significant BCD digit"
    RLC
    RLC
    RLC
    RLC         : "Adjust the position of the second digit (09 is changed to 90)"
    ANI FOH     : "Make least significant BCD digit zero"
    MOV C, A    : "store the partial result"
    LDA 4200H   : "Get the lower BCD digit"
    ADD C       : "Add lower BCD digit"
    STA 4300H   : "Store the result"
    HLT         : "Terminate program execution"