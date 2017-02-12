http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Store 8-bit data in memory

Program 1:
MVI A, 52H : "Store 32H in the accumulator"
STA 4000H  : "Copy accumulator contents at address 4000H"
HLT        : "Terminate program execution"

Program 2:
LXI H  : "Load HL with 4000H"
MVI M  : "Store 32H in memory location pointed by HL register pair (4000H)"
HLT    : "Terminate program execution"

Note: The result of both programs will be the same. In program 1 direct addressing instruction is used, whereas in program 2 indirect addressing instruction is used.
