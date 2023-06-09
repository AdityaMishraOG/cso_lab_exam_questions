.global eight
eight:
    # %rdi -> n
    # %rsi -> &arr[0]
    movq %rdi, %r15
    subq $1, %r15
loop1:
    cmpq $-1, %r15
    je inter
    movq $0, %r14
loop2:
    cmpq %r14, %r15
    je loop1_end
    # %r13 -> &arr[j + 1]
    # %r12 -> &arr[j]
    leaq (%rsi, %r14, 8), %r12
    movq %r12, %r13
    addq $8, %r13
    # %rdx -> arr[j + 1]
    # %rcx -> arr[j]
    movq (%r13), %rdx
    movq (%r12), %rcx
    cmpq %rcx, %rdx
    jl swap

loop2_end:
    incq %r14
    jmp loop2

loop1_end:
    decq %r15
    jmp loop1

swap:
    movq %rcx, (%r13)
    movq %rdx, (%r12)
    jmp loop2_end

inter:
    movq $0, %r15
    # subq $1, %rdi

loop3:
    cmpq %r15, %rdi
    je end
    movq %r15, %r14
    incq %r14
    cmpq %r14, %rdi
    je end

    leaq (%rsi, %r15, 8), %r12
    movq %r12, %r13
    addq $8, %r13
    # %rdx -> arr[j + 1]
    # %rcx -> arr[j]
    movq (%r13), %rdx
    movq (%r12), %rcx
    movq %rdx, (%r12)
    movq %rcx, (%r13)
    addq $2, %r15
    jmp loop3

end:
    movq $69, %rax
    ret
    
