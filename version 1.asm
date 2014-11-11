.data
frameBuffer:
.space 0x80000
.text

programa:

crear_Matriz:
li  $t1,15 # ancho de la matriz
li  $t2,10 # alto de la matriz
li  $t5, 4
mul $a0, $t1, $t2
mul $a0, $a0, $t5
li  $v0, 9
syscall
move $s0,$v0   # save array address in $s0

llenar_Matriz:
add $t6,$s0,$zero
li $t3,0
li $t7,0
mul $t8,$t1,$t2

loop_llenado:
sw $t3,($t6)
sll $t0,$t6,2
addi $t7,$t7,1
bne $t7,$t8,loop_llenado
j dibujar_Matriz

dibujar_Matriz:
li $t0,0xAD00A0 # color: morado
la $t1,frameBuffer # 
j pintar_Matriz

pintar_Matriz:
li $t0,0
li $t1,1
li $t2,2
li $t3,3
li $t4,4

lw $t9,($s0)
loopasd:
beq $t9,$t0,pintar_blanco
beq $t9,$t1,pintar_verde
beq $t9,$t2,pintar_celeste
beq $t9,$t3,pintar_rosado
beq $t9,$t4,pintar_hola
