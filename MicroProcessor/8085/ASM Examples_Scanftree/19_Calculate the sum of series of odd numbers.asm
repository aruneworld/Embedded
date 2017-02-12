http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Calculate the sum of series of odd numbers
Statement: Calculate the sum of series of odd numbers from the list of numbers. The length of the list is in memory location 2200H and the series itself begins from memory location 2201H. Assume the sum to be 16-bit. Store the sum at memory locations 2300H and 2301H.

Sample problem
2200H = 4H
2201H= 9AH
2202H= 52H
2203H= 89H
2204H= 3FH
Result = 89H + 3FH = C8H
2300H= H Lower byte
2301H = H Higher byte

    Source program : 
    LDA 2200H
    MOV C, A        :"Initialize counter"
    LXI H, 2201H    :"Initialize pointer"
    MVI E, 00       :"Sum low = 0"
    MOV D, E        :"Sum high = 0"
    BACK: MOV A, M  :"Get the number"
    ANI 0lH         :"Mask Bit 1 to Bit7"
    JZ SKIP         :"Don’t add if number is even"
    MOV A, E        :"Get the lower byte of sum"
    ADD M           :"Sum = sum + data"
    MOV E, A        :"Store result in E register"
    JNC SKIP
    INR D           :"Add carry to MSB of SUM"
    SKIP: INX H     :"Increment pointer"