.global three 
three:
    # %rdi -> n
    # %rax -> n (copy)
    # %r8 -> 0 (used to reverse n)
    # %r9 -> 10
    movq %rdi, %rax
    movq $0, %r8
    movq $10, %r9

loop:
    cmpq $0, %rax
    je end
    movq $0, %rdx
    idivq %r9
    imulq $10, %r8
    addq %rdx, %r8
    jmp loop

end:
    cmpq %rdi, %r8
    je palindrome
    movq $0, %rax
    ret

palindrome:
    movq $1, %rax
    ret


