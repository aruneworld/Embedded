http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Finding one’s complement of a number
Statement: Find the l’s complement of the number stored at memory location 4400H and store the complemented number at memory location 4300H.

    Sample problem:
    (4400H) = 55H
    Result = (4300B) = AAB
    Source program:
    LDA 4400B : "Get the number"
    CMA       : "Complement number"
    STA 4300H : "Store the result"
    HLT       : "Terminate program execution"