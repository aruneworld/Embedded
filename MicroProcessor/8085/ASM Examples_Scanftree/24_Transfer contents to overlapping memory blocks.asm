http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Transfer contents to overlapping memory blocks
Statement: Write assembly language program with proper comments for the following:
A block of data consisting of 256 bytes is stored in memory starting at 3000H. This block is to be shifted (relocated) in memory from 3050H onwards. Do not shift the block or part of the block anywhere else in the memory.

Two blocks (3000 – 30FF and 3050 – 314F) are overlapping. Therefore it is necessary to transfer last byte first and first byte last.

    MVI C, FFH      :"Initialize counter"
    LX I H, 30FFH   :"Initialize source memory pointer 3l4FH"
    LXI D, 314FH    :"Initialize destination memory pointer"
    BACK: MOV A, M  :"Get byte from source memory block"
    STAX D          :"Store byte in the destination memory block"
    DCX H           :"Decrement source memory pointer"
    DCX             :"Decrement destination memory pointer"
    DCR C           :"Decrement counter"
    JNZ BACK        :"If counter   0 repeat"
    HLT             :"Stop execution"