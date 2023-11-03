.data
array: .word 15,13,19,11,8,21,14,9
up: .word 01 #store 0 for descending order and 1 for ascending order
size: .word 8
.text
j start
swap:
    add a1,a1,a2
    sub a2,a1,a2
    sub a1,a1,a2
    sw a1,0(x5)
    sw a2,0(x6)
    j callback

start:
la x1,array
lw x3,up
lw x2,size
addi x2,x2,-2
loop1:
    li x4,0 #inner loop counter
    loop2:
        slli x5,x4,2
        addi x6,x5,4
        add x5,x1,x5
        add x6,x1,x6
        lw a1,0(x5)
        lw a2,0(x6)
        slt a0,a2,a1
        beq x3,a0,swap
    callback:
        addi x4,x4,1
        bgt x4,x2,updateloop1
        j loop2
    updateloop1:
        beq x2,x0,end
        addi x2,x2,-1
        j loop1

end:
    nop