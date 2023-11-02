.data
A: .word 99
B: .word 19

.text

j start
dndzero:
    li a1,1
    li a2,0
    li a3,0
    j ender

divzero:
    li a1,-1
    li a2,0
    li a3,0
    j ender

convdnd:
	sub x1,x0,x1
	j back

convdiv:
	sub x2,x0,x2
	j back 


start:
lw x1,A
lw x2,B
beq x1,x0,dndzero
beq x2,x0,divzero

slt x3,x1,x0 #checking for negative
slt x4,x2,x0 #checking for negative
xor x5,x4,x3 #checking for common sign

back:
	ble x1,x0,convdnd
	ble x2,x0,convdiv

li a2,0
loop:
	blt x1,x2,negcheck
	sub x1,x1,x2
	addi a2,a2,1
	j loop
negcheck:
    beq x5,x0,end
    sub a2,x0,a2
    j end

flag:
    sub a3,x0,a3
    j ender

rem:
    li a1,0
    mv a3,x1
    bne x3,x0,flag
    j ender

end:
    mv a1,x1
    li a3,0
    bne a1,x0,rem
	li a1,1
ender:
    nop
