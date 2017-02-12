http://scanftree.com/microprocessor/Programs-For-8085-Microprocessor-Learners

Execution format of instructions
Statement: Read the program given below and state the contents of all registers after the execution of each instruction in sequence.

    Main program:
    4000H     LXI SP, 27FFH
    4003H     LXI H, 2000H
    4006H     LXI B, 1020H
    4009H     CALL SUB
    400CH     HLT
    Subroutine program: 
    4100H     SUB: PUSH B
    4101H     PUSH H
    4102H     LXI B, 4080H
    4105H     LXI H, 4090H
    4108H     SHLD 2200H
    4109H     DAD B
    410CH     POP H
    410DH     POP B
    410EH     RET