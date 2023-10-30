#search number in array and store the  location where the number is stored 
.data
num: .byte 0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x5,0x10,0x11
k: .byte 0x05
ind: .zero 8
.text

la x1,num
la x2,k
la x3,ind

lbu x4,0(x2)

loop:
    lbu x5,0(x1)
    beq x5,x4,res
    addi x1,x1,1
    beq x1,x2,ender
    j loop
res:
    sw x1,0(x3)
    addi x1,x1,1
    addi x3,x3,4
    j loop
    
ender:
    li x10,0x00
    sw x10,0(x3)
    nop