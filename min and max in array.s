.data
ary: .word 1,2,3,4,5,6,7,8
size: .word 8

.text
j start
min:
    add a2,x5,x0
    j minback

max:
    add a1,x5,x0
    j maxback


start:
li a1,0
lui a2,0x7ffff
li x1,0xfff
add a2,a2,x1

la x1,ary
la x2,size

lw x3,0(x2)
li x4,0
loop:
    beq x4,x3,end
    lw x5,0(x1)
    bgt x5,a1,max
    maxback:
    blt x5,a2,min
    minback:
    addi x4,x4,1
    addi x1,x1,4
    j loop
end:
    nop