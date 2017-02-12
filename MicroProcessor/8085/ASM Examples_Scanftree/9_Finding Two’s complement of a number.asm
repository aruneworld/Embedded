http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Finding Two’s complement of a number
Statement: Find the 2′s complement of the number stored at memory location 4200H and store the complemented number at memory location 4300H

    Sample problem:
    (4200H) = 55H
    Result = (4300H) = AAH + 1 = ABH
    Source program:
    LDA 4200H  : "Get the number"
    CMA        : "Complement the number"
    ADI, 01 H  : "Add one in the number"
    STA 4300H  : "Store the result"
    HLT        : "Terminate program execution"