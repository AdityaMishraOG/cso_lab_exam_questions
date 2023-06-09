.global one
one:
    # %rdi -> x
    movq %rdi, %rax
    movq $2, %r15
    movq $0, %r14

loop:
    cmpq $0, %rax
    je return_part
    movq $0, %rdx
    idivq %r15
    addq %rdx, %r14
    jmp loop

return_part:
    movq %r14, %rax 
    ret



