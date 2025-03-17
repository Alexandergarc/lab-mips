#Programa 1: Encontrar el número mayor
.data # Se usa para definir y almacenar los datos que se van a utilizar en el programa
	msg_pedir: .asciiz "Ingrese la cantidad de números a comprar (min 3, max 5)" #Mensaje para solicitar la cantidad de numeros
	msg_num: .asciiz "Ingrese un número: " #Mensaje para solicitar un número
	msg_mayor: .asciiz "El número mayor es: " #Mensaje para mostrar el número mayor

.text #Sección de codigo, donde se escriben las instrucciones ejecutables
.globl main #Se define la etiqueta 'main'como global para que el ensamblador la recnozca como punto de entrada

main:
    # Pide la cantidad de números
    li $v0, 4  # Código de sistema para imprimir cadena
    la $a0, msg_pedir  # Cargar dirección del mensaje
    syscall  # Llamada al sistema para imprimir
    
    li $v0, 5  # Código de sistema para leer un entero
    syscall  # Espera entrada del usuario
    move $t0, $v0  # Guarda la cantidad de números ingresados
    
    li $t1, 0  # Inicializa contador en 0
    li $t2, -2147483648  # Inicializa con el menor valor posible para comparación
    
loop:
    beq $t1, $t0, fin  # Si se ingresaron todos los números, salta a fin
    
    li $v0, 4  # Imprime mensaje de solicitud de número
    la $a0, msg_num
    syscall
    
    li $v0, 5  # Leer número ingresado
    syscall
    move $t3, $v0  # Guardar número ingresado
    
    # Comparar con el número mayor actual
    bgt $t3, $t2, actualizar_mayor  # Si el número ingresado es mayor, actualizar
    j siguiente  # Saltar a siguiente iteración
    
actualizar_mayor:
    move $t2, $t3  # Actualiza el número mayor
    
siguiente:
    addi $t1, $t1, 1  # Incrementa el contador
    j loop  # Repite el bucle
    
fin:
    li $v0, 4  # Imprime mensaje del número mayor encontrado
    la $a0, msg_mayor
    syscall
    
    li $v0, 1  # Imprime el número mayor
    move $a0, $t2
    syscall
    
    li $v0, 10  # Finaliza el programa
    syscall