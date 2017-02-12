http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Trainees

Count number of one’s in a number
Statement: Write a program to count number of l’s in the contents of D register and store the count in the B register.

Sample problem
(2200H) =  04
(2201H) = 34H
(2202H) = A9H
(2203H) = 78H
(2204H) = 56H
Result = (2202H) = A9H

    MVI B, 00H
    MVI C, 08H
    MOV A, D
    BACK: RAR
    JNC SKIP
    INR B
    SKIP: DCR C
    JNZ BACK
    HLT 