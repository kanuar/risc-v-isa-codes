.data

k: .string "abcbad"
stk: .word 0x12000000

.text
lw sp,stk
la x1,k

pushtostack:
    lbu x4,0(x1)
    beq x4,x0,calc
    addi x8,x8,1
    sb x4,-1(sp)
    addi x1,x1,1
    addi sp,sp,-1
    j pushtostack
    
calc:
    la x1,k
loop: 
    lb x4,0(sp)
    lb x5,0(x1)
    beq x5,x0,res
    addi x1,x1,1
    addi x2,x2,1
    xor x6,x5,x4
    sgt x6,x6,x0
    bne x6,x0,res
    j loop
res:
    li x9,1
    xor x1,x9,x6
    nop