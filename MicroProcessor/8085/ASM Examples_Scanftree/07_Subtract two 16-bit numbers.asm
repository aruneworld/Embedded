http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Subtract two 16-bit numbers
Statement: 	Subtract the 16-bit number in memory locations 4002H and 4003H from the 16-bit number in memory locations 4000H and 4001H.
			The most significant eight bits of the two numbers are in memory locations 4001H and 4003H.
			Store the result in memory locations 4004H and 4005H with the most significant byte in memory location 4005H.

    Sample problem:
    (4000H) = 19H
    (4001H) = 6AH
    (4002H) = 15H 
	(4003H) = 5CH
    Result    = 6A19H – 5C15H = OE04H
    (4004H) = 04H
    (4005H) = OEH
    Source program: 
    LHLD 4000H  : "Get first 16-bit number in HL"
    XCHG        : "Save first 16-bit number in DE"
    LHLD 4002H  : "Get second 16-bit number in HL"
    MOV A, E    : "Get lower byte of the first number"
    SUB L       : "Subtract lower byte of the second number"
    MOV L, A    : "Store the result in L register"
    MOV A, D    : "Get higher byte of the first number"
    SBB H       : "Subtract higher byte of second number with borrow"
    MOV H, A    : "Store l6-bit result in memory locations 4004H and 4005H"
    SHLD 4004H  : "Store l6-bit result in memory locations 4004H and 4005H"
    HLT         : "Terminate program execution"
