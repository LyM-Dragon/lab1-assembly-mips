# Lab1 mips lmolina 
.data
saludo: .asciiz "ingrese numero para fibonacci: "
.text
.globl main
    main:
      lectura:
        li $s0, 1 # variable auxiliar para representar el valor 1
        la $a0, saludo
        li $v0, 4
        syscall
        li $a0, 1 # variable para almacenar resultado de factorial
        li $v0, 5
        syscall
        add $a1, $v0, $0
      factorial:
        slti $t0, $a1, 2 # si el argumento dado es menor que 2 $t0 es 1 sino es 0
        beq $t0, $s0, exit # si $a1 es menor que 2 salta a exit
        multu $a1, $a0
        mflo $a0 # acumula resultado en $a0, solo resultados de hasta 32 bits
        addi $a1, $a1, -1 # obtiene el proximo numero con el cual se deberá multiplicar
        j factorial
      exit:
        li $v0, 1
        syscall
        li $v0, 10
	      syscall