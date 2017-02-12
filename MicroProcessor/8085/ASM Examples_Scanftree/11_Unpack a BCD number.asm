http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Unpack a BCD number
Statement: Two digit BCD number is stored in memory location 4200H. Unpack the BCD number and store the two digits in memory locations 4300H and 4301H such that memory location 4300H will have lower BCD digit.

    Sample problem:
    (4200H) = 58
    Result = (4300H) = 08 and
        (4301H) = 05
    Source program: 
    LDA 4200H  : "Get the packed BCD number"
    ANI FOH    : "Mask lower nibble"
    RRC
    RRC
    RRC
    RRC        : "Adjust higher BCD digit as a lower digit"
    STA 4301H  : "Store the partial result"
    LDA 4200H  : "Get the original BCD number"
    ANI OFH    : "Mask higher nibble"
    STA 4201H  : "Store the result"
    HLT        : "Terminate program execution"