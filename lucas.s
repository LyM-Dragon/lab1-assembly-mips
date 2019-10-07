# Lab1 mips lmolina 
.data
saludo: .asciiz "ingrese numero para calcular suma de serie de lucas: "
.text
.globl main
    main:
      lectura:
        la $a0, saludo
        li $v0, 4
        syscall
        li $a0, 2 # variable para almacenar resultado de suma serie de lucas, primer numero de lucas por default.
        li $v0, 5
        syscall
        add $a1, $v0, $0
      setup:
        li $s0, 1 # variable auxiliar para representar el valor 1
        li $s1, 2 # varialbe x = 2 (primer numero de lucas)
        li $s2, 1 # varialbe y = 1 (segundo numero de lucas)
        li $s3, 3 # variable z = 3 (tercer numero de lucas)
      lucas:
        slti $t0, $a1, 1 # si el argumento dado es menor que 1 $t0 es 1 sino es 0
        beq $t0, $s0, exit # si $a1 es menor que 1 salta a exit
        add $s1, $s2, $0
        add $s2, $s3, $0
        add $s3, $s1, $s2
        add $a0, $a0, $s1 # acumula suma
        addi $a1, $a1, -1 # disminuye contador
        j lucas
      exit:
        li $v0, 1
        syscall
        li $v0, 10
	      syscall