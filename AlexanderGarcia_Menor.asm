# Programa 2: Encontrar el número menor
.data
    msg_pedir_menor: .asciiz "Ingrese la cantidad de números a comparar (min 3, max 5): "  # Mensaje para solicitar la cantidad de números
    msg_num_menor: .asciiz "Ingrese un número: "  # Mensaje para solicitar un número
    msg_menor: .asciiz "El número menor es: "  # Mensaje para mostrar el número menor
.text
.globl main
main:
    li $v0, 4  # Código de sistema para imprimir cadena
    la $a0, msg_pedir_menor  # Cargar dirección del mensaje
    syscall  # Llamada al sistema para imprimir
    
    li $v0, 5  # Código de sistema para leer un entero
    syscall  # Espera entrada del usuario
    move $t0, $v0  # Guarda la cantidad de números ingresados
    
    li $t1, 0  # Inicializa contador en 0
    li $t2, 2147483647  # Inicializa con el mayor valor posible para comparación   
loop:
    beq $t1, $t0, fin  # Si se ingresaron todos los números, salta a fin
    
    li $v0, 4  # Imprime mensaje de solicitud de número
    la $a0, msg_num_menor
    syscall
    
    li $v0, 5  # Leer número ingresado
    syscall
    move $t3, $v0  # Guardar número ingresado
    
    blt $t3, $t2, actualizar_menor  # Si el número ingresado es menor, actualizar
    j siguiente  # Saltar a siguiente iteración  
actualizar_menor:
    move $t2, $t3  # Actualiza el número menor    
siguiente:
    addi $t1, $t1, 1  # Incrementa el contador
    j loop  # Repite el bucle    
fin:
    li $v0, 4  # Imprime mensaje del número menor encontrado
    la $a0, msg_menor
    syscall
   
    li $v0, 1  # Imprime el número menor
    move $a0, $t2
    syscall
    
    li $v0, 10  # Finaliza el programa
    syscall
    