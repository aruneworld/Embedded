http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Add two 8-bit numbers
Statement: Add the contents of memory locations 4000H and 4001H and place the result in memory location 4002H.

    Sample problem 
    (4000H) = 14H
    (4001H) = 89H
    Result     = 14H + 89H = 9DH
     
    Source program
    LXI H 4000H : "HL points 4000H"
    MOV A, M    : "Get first operand"
    INX H       : "HL points 4001H"
    ADD M       : "Add second operand"
    INX H       : "HL points 4002H"
    MOV M, A    : "Store result at 4002H"
    HLT         : "Terminate program execution"
