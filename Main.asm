section .data
    msg db "Hello, world!", 0xA  ; Message with newline character
    len equ $ - msg              ; Calculate message length

section .text
    global _start

_start:
    ; Write system call
    mov rax, 1           ; sys_write system call number
    mov rdi, 1           ; file descriptor (stdout)
    mov rsi, msg         ; address of message
    mov rdx, len         ; message length
    syscall              ; invoke kernel

    ; Exit system call
    mov rax, 60          ; sys_exit system call number
    xor rdi, rdi         ; exit status 0
    syscall              ; invoke kernel   
