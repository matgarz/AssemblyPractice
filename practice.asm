;1 to N sum

section .bss
    num resb 4

section .data
    prompt db 'Enter the number N: ', 0
    result_msg db 'The sum from 1 to ', 0
    is db ' is: ', 0
    format db '%d', 10, 0

section .text
    global main
    extern printf
    extern scanf

main:
    mov eax, prompt
    call printf

    mov eax, format
    lea rdi, [num]
    call scanf

    mov eax, [num]
    test eax, eax
    jle done

    mov ecx, 1
    mov ebx, 0

loop_sum:
    add ebx, ecx
    inc ecx
    cmp ecx, eax
    jle loop_sum

done:
    mov esi, ebx
    mov edi, result_msg
    call printf
    mov edi, eax
    mov eax, format
    call printf

    xor eax, eax
    ret
