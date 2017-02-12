http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Right shift, bit of data( 8 bit and 16 bit)
Statement: Write a program to shift an eight bit data four bits right. Assume data is in register C.

    Sample problem:
    (4200H) = 58
    Result = (4300H) = 08 and
        (4301H) = 05
     
    Source program 1: 
    MOV A, C
    RAR
    RAR
    RAR
    RAR
    MOV C, A
    HLT

Statement: Write a program to shift a 16 bit data, 1 bit right. Assume that data is in BC register pair.

    Source program 2
    MOV A, B
    RAR
    MOV B, A
    MOV A, C
    RAR
    MOV C, A
    HLT