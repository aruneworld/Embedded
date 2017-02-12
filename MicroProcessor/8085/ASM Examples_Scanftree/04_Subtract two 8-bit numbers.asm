http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Subtract two 8-bit numbers
Statement: Subtract the contents of memory location 4001H from the memory location 2000H and place the result in memory location 4002H.

    Program –: Subtract two 8-bit numbers 
    Sample problem: 
    (4000H) = 51H
    (4001H) = 19H
    Result    = 51H – 19H = 38H 
     
    Source program: 
    LXI H, 4000H : "HL points 4000H"
    MOV A, M     : "Get first operand"
    INX H        : "HL points 4001H"
    SUB M        : "Subtract second operand"
    INX H        : "HL points 4002H"
    MOV M, A     : "Store result at 4002H"
    HLT          : "Terminate program execution"

