http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Search a byte in a given number
Statement: Search the given byte in the list of 50 numbers stored in the consecutive memory locations and store the address of memory location in the memory locations 2200H and 2201H. Assume byte is in the C register and starting address of the list is 2000H. If byte is not found store 00 at 2200H and 2201H.

    LX I H, 2000H     :"Initialize memory pointer 52H"
    MVI B, 52H        :"Initialize counter"
    BACK: MOV A, M    :"Get the number"
    CMP C             :"Compare with the given byte"
    JZ LAST           :"Go last if match occurs"
    INX H             :"Increment memory pointer"
    DCR B             :"Decrement counter"
    JNZ B             :"If not zero, repeat"
    LXI H, 0000H
    SHLD 2200H
    JMP END           :"Store 00 at 2200H and 2201H"
    LAST: SHLD 2200H  :"Store memory address"
    END:  HLT         :"Stop"