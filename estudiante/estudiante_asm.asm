
section .text

; int *estudianteCrear(char *nombre, char *grupo, unsigned int edad)
  estudiante:

    ; Armo stack frame SALVANDO TODOS los registros
  	push RBP
  	mov RBP, RSP
  	push RBX
  	push R12
  	push R13
  	push R14
  	push R15

    ;codigo
    mov rbx, rdi ; guardo en rbx el nombre
    mov rdi, ESTUDIANTE_SIZE ; guardo en rdi el tamaño de un estudiante, para luego llamar a malloc
    call malloc ; me devuelve en rax la posicion del estudiante nuevo
    

    fin:
      ; Desarmo stack frame
      pop r15
      pop r14
      pop r13
      pop r12
      pop rbx
      pop rbp
      ret
