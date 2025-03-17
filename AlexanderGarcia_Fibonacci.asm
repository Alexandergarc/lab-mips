# Programa 3: Serie de Fibonacci
.data
    msg_pedir_fib: .asciiz "Ingrese la cantidad de números de la serie Fibonacci: "  # Mensaje para solicitar la cantidad de términos
    msg_fib: .asciiz "Serie Fibonacci: "  # Mensaje antes de imprimir la serie
    msg_suma: .asciiz "Suma de la serie: "  # Mensaje para mostrar la suma de los términos
.text
.globl main
main:
    li $v0, 4
    la $a0, msg_pedir_fib
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0  # Guarda la cantidad de términos a generar
    
    li $t1, 0  # Primer término de Fibonacci
    li $t2, 1  # Segundo término de Fibonacci
    li $t3, 0  # Contador de iteraciones
    li $t4, 0  # Acumulador de la suma total
    
    li $v0, 4
    la $a0, msg_fib
    syscall    
loop_fib: #Etiqueta que marca el inicio de un bucle
    beq $t3, $t0, fin_fib  # Si se generaron todos los términos, finalizar
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 11  # Imprimir un espacio
    li $a0, 32  # Código ASCII de ' '
    syscall 
    
    add $t4, $t4, $t1  # Sumar el término actual
    
    add $t5, $t1, $t2  # Calcular el siguiente término
    move $t1, $t2
    move $t2, $t5
    addi $t3, $t3, 1  # Incrementar el contador
    j loop_fib  # Repetir el bucle
fin_fib:
    li $v0, 4
    la $a0, msg_suma
    syscall
    li $v0, 1
    move $a0, $t4  # Imprimir la suma total
    syscall
    li $v0, 10  # Finalizar el programa
    syscall
    