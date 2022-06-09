.data
array: .space 16
array2: .space 16
msg: .asciiz "\n Numero: "
msg2: .asciiz "\n  "
msg3: .asciiz "\n Input:  "
msg4: .asciiz "\n Output:  "
.text
.globl main

main:
    li $t0,0 #iterador
    la $t1, array #pos = 0
    la $t9, array2 #pos = 0
while: 
    
    #Mensaje de Numero
    li $v0,4
    la $a0, msg
    syscall
    
    #Pedir numero
    li $v0, 5
    syscall
    move $t2, $v0 #t2 = numero que lei de consola

    #guardar en array
    sw $t2, 0($t1) #arr[pos] = numero que lei de consola

    #incrementar posicion en array
    addi $t1, $t1, 4 # pos+=4
    
    
    #fin del while con el iterador sumandole 1
    addi $t0, $t0, 1
    blt $t0, 5, while

#for 1
li $t6, 0
la $t1, array #pos = 0
for:

    li $t2, 4
    mult $t6, $t2
    mflo $t2
    add $t2,$t1,$t2 
    lw $t2, 0($t2) # arr[j]
    li $t5,2

    div $t2 , $t5
    mfhi $t5

    beq $t5, 0, entro
  
    addi $t6, $t6,1
    blt $t6, 5, for
entro:
     #guardar en array
    sw $t2, 0($t9) #arr[pos] = numero que lei de consola
    #incrementar posicion en array
    addi $t9, $t9, 4 # pos+=4
    addi $t6, $t6,1
    blt $t6, 5, for
 
#for 2
li $t6, 0
for2:

    li $t2, 4
    mult $t6, $t2
    mflo $t2
    add $t2,$t1,$t2 
    lw $t2, 0($t2) # arr[j]
    li $t5,2

    div $t2 , $t5
    mfhi $t5

    beq $t5, 1, entro2
  
    addi $t6, $t6,1
    blt $t6, 5, for2

entro2:
     #guardar en array
    sw $t2, 0($t9) #arr[pos] = numero que lei de consola
    #incrementar posicion en array
    addi $t9, $t9, 4 # pos+=4
    addi $t6, $t6,1
    blt $t6, 5, for2


li $t6, 0
la $t1, array #pos = 0

#mensaje 1
li $v0,4
la $a0, msg3
syscall
for_print:

    li $t2, 4
    mult $t6, $t2
    mflo $t2
    add $t2,$t1,$t2 
    lw $t2, 0($t2) # arr[j]

    #print number
    move $a0, $t2
    li $v0, 1
    syscall

    # print space, 32 is ASCII code for space
    li $a0, 32
    li $v0, 11
    syscall
    addi $t6, $t6,1
blt $t6, 5, for_print

#print 2
li $t6, 0
la $t1, array2 #pos = 0

li $v0,4
la $a0, msg4
syscall
for_print2:

    li $t2, 4
    mult $t6, $t2
    mflo $t2
    add $t2,$t1,$t2 
    lw $t2, 0($t2) # arr[j]

    #print number
    move $a0, $t2
    li $v0, 1
    syscall

    # print space, 32 is ASCII code for space
    li $a0, 32
    li $v0, 11
    syscall
    addi $t6, $t6,1
blt $t6, 5, for_print2

fin:
    #fin del programa
    li $v0, 10
    syscall
