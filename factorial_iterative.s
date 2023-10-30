.data
num: .word 0x05
stk: .word 0x12000000

.text
la x1,num
lw sp,stk
lbu x3,0(x1)

pushtostk:
    sb x3,0(sp)
    addi sp,sp,1
    addi x3,x3,-1
    bne x3,x0,pushtostk

addi sp,sp,-1
lbu x3,0(x1)
li x4,1

calc:
    lbu x5,0(sp)
    mul x4,x4,x5
    addi sp,sp,-1
    bne x3,x5,calc

sw x4,4(x1)