.data
a: .word 1,2,3,4,5,6,7,8,9,0x10
b: .word 0x11,0x12,0x13,0x14,0x15,0x16,0x17,0x18,0x19,0x20
c: .zero 4*11
count: .word 10
.text
la x1,a
la x2,b
la x3,c
addi x3,x3,4
la x10,count
lw x11,0(x10)
loop:
    lw x4,0(x1)
    lw x5,0(x2)
    lw x6,-4(x3)
    mul x7,x4,x5 #calculate a[i] * b[i]
    add x7,x7,x6 #add c[i-1] to x7 (temporary variable)
    addi x1,x1,4
    addi x2,x2,4
    addi x11,x11,-1
    sw x7,0(x3)
    addi x3,x3,4
    bgt x11,x0,loop
ender:
    nop