http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Find the square of given number
Statement: Find the square of the given numbers from memory location 6100H and store the result from memory location 7000H.

Sample problem
2200H = 4H
2201H= 9AH
2202H= 52H
2203H= 89H
2204H= 3FH
Result = 89H + 3FH = C8H
2300H= H Lower byte
2301H = H Higher byte

    LXI H, 6200H  :"Initialize lookup table pointer"
    LXI D, 6100H  :"Initialize source memory pointer"
    LXI B, 7000H  :"Initialize destination memory pointer"
    BACK: LDAX D  :"Get the number"
    MOV L, A      :"A point to the square"
    MOV A, M      :"Get the square"
    STAX B        :"Store the result at destination memory location"
    INX D         :"Increment source memory pointer"
    INX B         :"Increment destination memory pointer"
    MOV A, C
    CPI 05H       :"Check for last number"
    JNZ BACK      :"If not repeat"
    HLT           :"Terminate program execution"