# Lab1 mips lmolina 
.data
saludo1: .asciiz "ingrese primer numero para calcular MCD: "
saludo2: .asciiz "ingrese segundo numero para calcular MCD: "
.text
.globl main
    main:
      lectura:
        la $a0, saludo1
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        add $a1, $v0, $0 # guarda primer argumento
        la $a0, saludo2
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        add $a2, $v0, $0 # guarda segundo argumento
      setup:
        li $a0, 1 # variable para almacenar GCD (greatest common divisor)
        li $s0, 1 # variable auxiliar para representar el valor 1
      MCD:
        beq $a1, $a2, exit
        slt $t0, $a1, $a2 # si $a1 es menor que $a2 $t0 es 1 sino es 0
        beq $t0, $s0, disminuirA2
        sub $a1, $a1, $a2 # resta de $a1
        j MCD
      disminuirA2:
        sub $a2, $a2, $a1 # resta de $a2
        j MCD
      exit:
        add $a0, $a1, $0
        li $v0, 1
        syscall
        li $v0, 10
	      syscall