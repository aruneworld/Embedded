http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Calculate the sum of series of even numbers
Statement: Calculate the sum of series of even numbers from the list of numbers. The length of the list is in memory location 2200H and the series itself begins from memory location 2201H. Assume the sum to be 8 bit number so you can ignore carries and store the sum at memory location 2210H.

Sample problem
2200H= 4H
2201H= 20H
2202H= l5H
2203H= l3H
2204H= 22H
Result 22l0H= 20 + 22 = 42H
= 42H

    LDA 2200H
    MOV C, A        :"Initialize counter"
    MVI B, 00H      :"sum = 0"
    LXI H, 2201H    :"Initialize pointer"
    BACK: MOV A, M  :"Get the number"
    ANI 0lH         :"Mask Bit l to Bit7"
    JNZ SKIP        :"Don’t add if number is ODD"
    MOV A, B        :"Get the sum"
    ADD M           :"SUM = SUM + data"
    MOV B, A        :"Store result in B register"
    SKIP: INX H     :"increment pointer"
    DCR C           :"Decrement counter"
    JNZ BACK        :"if counter  0 repeat"
    STA 2210H       :"store sum"
    HLT             :"Terminate program execution"