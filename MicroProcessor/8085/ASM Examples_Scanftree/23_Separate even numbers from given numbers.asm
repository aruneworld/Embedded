http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Separate even numbers from given numbers
Statement: Write an assembly language program to separate even numbers from the given list of 50 numbers and store them in the another list starting from 2300H. Assume starting address of 50 number list is 2200H.

    LXI H, 2200H     :"Initialize memory pointer l"
    LXI D, 2300H     :"Initialize memory pointer2"
    MVI C, 32H       :"Initialize counter"
    BACK:MOV A, M    :"Get the number"
    ANI 0lH          :"Check for even number"
    JNZ SKIP         :"If ODD, don’t store"
    MOV A, M         :"Get the number"
    STAX D           :"Store the number in result list"
    INX D            :"Increment pointer 2"
    SKIP: INX H      :"Increment pointer l"
    DCR C            :"Decrement counter"
    JNZ BACK         :"If not zero, repeat"
    HLT              :"Stop