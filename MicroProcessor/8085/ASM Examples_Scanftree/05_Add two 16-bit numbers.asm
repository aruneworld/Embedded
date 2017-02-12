http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Add two 16-bit numbers
Statement: Add the 16-bit number in memory locations 4000H and 4001H to the 16-bit number in memory locations 4002H and 4003H. The most significant eight bits of the two numbers to be added are in memory locations 4001H and 4003H. Store the result in memory locations 4004H and 4005H with the most significant byte in memory location 4005H.

    Sample problem:
    (4000H) = 15H
    (4001H) = 1CH
    (4002H) = B7H
    (4003H) = 5AH
    Result = 1C15 + 5AB7H = 76CCH
    (4004H) = CCH
    (4005H) = 76H
     
    Source Program 1:
    LHLD 4000H  : "Get first I6-bit number in HL"
    XCHG        : "Save first I6-bit number in DE"
    LHLD 4002H  : "Get second I6-bit number in HL"
    MOV A, E    : "Get lower byte of the first number"
    ADD L       : "Add lower byte of the second number"
    MOV L, A    : "Store result in L register"
    MOV A, D    : "Get higher byte of the first number"
    ADC H       : "Add higher byte of the second number with CARRY"
    MOV H, A    : "Store result in H register"
    SHLD 4004H  : "Store I6-bit result in memory locations 4004H and 4005H"
    HLT         : "Terminate program execution"

    Source program 2:
    LHLD 4000H : Get first I6-bit number
    XCHG : Save first I6-bit number in DE
    LHLD 4002H : Get second I6-bit number in HL
    DAD D : Add DE and HL
    SHLD 4004H : Store I6-bit result in memory locations 4004H and 4005H.
    HLT : Terminate program execution

NOTE: In program 1, eight bit addition instructions are used (ADD and ADC) and addition is performed in two steps. First lower byte addition using ADD instruction and then higher byte addition using ADC instruction.In program 2, 16-bit addition instruction (DAD) is used.
