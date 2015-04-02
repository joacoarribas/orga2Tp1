global string_longitud
global string_copiar
global string_menor
extern malloc

section .text

;unsigned char string_longitud(char *s)
;recorrer el string hasta encontrar el caracter NUL (0)
  string_longitud:

    ; Armo stack frame SALVANDO TODOS los registros
  	push RBP
  	mov RBP, RSP
  	push RBX
  	push R12
  	push R13
  	push R14
  	push R15

    ;codigo
    mov rax, 0 ; utilizo a rax como mi contador
    ciclo:
      cmp BYTE [rdi], 0 ; me fijo si llegue al caracter NUL (0) de string de C
      je fin
      add rax, 1 ; aumento el contador
      add rdi, 1 ; me muevo uno en la posicion de memoria, el tamanio de un char es 1 byte
      jmp ciclo

    fin:
      ; Desarmo stack frame
      pop r15
      pop r14
      pop r13
      pop r12
      pop rbx
      pop rbp
      ret

; char *string_copiar(char *s)
  string_copiar:

    ; Armo stack frame SALVANDO TODOS los registros
  	push RBP
  	mov RBP, RSP
  	push RBX
  	push R12
  	push R13
  	push R14
  	push R15

    ;codigo
    push rdi ; guardo el string que me pasan por parametro en la pila
    call string_longitud ; me devuelve en rax la longitud del string
    mov rbx, rax ; guardo en rbx la longitud del string pasado por parametro
    mov rdi, rax ; muevo a rdi la longitud del string para llamar a malloc
    call malloc ;me devuelve en rax el puntero a la memoria solicitada
    pop rdi ; retorno el valor del string que me pasan por parametro

    ; rdi = string que me pasan por parametro
    ; rax = puntero a la memoria solicitada

    ciclo2:
      cmp BYTE [rdi], 0 ; me fijo si llego al caracter NUL (0) del string a copiar
      je fin2
      mov r12b, [rdi] ; muevo a r12 el primer caracter del string a copiar
      mov [rax], r12b ; muevo a lo que apunta rax (puntero a la posicion de memoria que me dio malloc) el caracter del string a copiar
      add rdi, 1 ; me muevo uno en la posicion de memoria, el tamanio de un char es 1 byte
      add rax, 1 ; me muevo uno en la posicion de memoria que me dio malloc, donde copio el string
      jmp ciclo2


    fin2:
      sub rax, rbx
      jmp fin

; bool string_menor(char *s1, char *s2)
  string_menor:

    ; Armo stack frame SALVANDO TODOS los registros
  	push RBP
  	mov RBP, RSP
  	push RBX
  	push R12
  	push R13
  	push R14
  	push R15

    ; Codigo

    ciclo3:
      mov bl, [rdi] ; guardo en bl (parte baja de rbx) el caracter de rdi, primer parametro
      mov r12b, [rsi] ; guardo en r12b (parte baja de r12) el caracter de rsi, segundo parametro
      cmp BYTE [rdi], 0 ; me fijo si rdi ya termino de recorrer la palabra
      je verSiSonIguales ; me fijo si rcx tambien ya termino de recorrer la palabra
      add rdi, 1 ; me muevo una posicion de memoria
      add rsi, 1 ; me muevo una posicion de memoria

      cmp bl, r12b ; comparo los dos caracteres
      jl finTrue ;si rdx < rcx ya esta
      je ciclo3 ; si rdx = rcx, es decir que el caracter del primre parametro es menor o igual que el del segundo, sigo el ciclo
      jg finFalse ; sino devuelvo false

    ; Pre: rdx ya termino de recorrer la palabra
    verSiSonIguales:
      cmp BYTE [rsi], 0 ; si rsi tambien termino de recorrer la palabra
      jg finTrue ; si no termino devuelvo true
      je finFalse ; si termino devuelvo false

    finTrue:
      mov rax, 1 ; devuelvo true
      jmp fin

    finFalse:
      mov rax, 0 ; devuelvo false
      jmp fin

