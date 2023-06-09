.global twelve
twelve:
    # %rdi -> 2 * n
    # %r8 -> n
    # %rsi -> &arr[0]
    # %rdx ->  x
    # %r15 -> i
    # %r14 -> j
    movq %rdi, %r8
    imulq $2, %rdi

   

    # %rdi -> n
    # %rsi -> &a[0]

    # %r15 -> i
    # %r14 -> j
    movq %rdi, %r15
    subq $1, %r15

loop1:
    cmpq $-1, %r15
    je inter
    movq $0, %r14
loop2:
    cmpq %r14, %r15
    je loop1_end
    # %r13 -> &a[j]
    # %r12 -> &a[j + 1]
    leaq (%rsi, %r14, 8), %r13
    movq %r13, %r12
    addq $8, %r12
    # %rdx -> a[j]
    # %rcx -> a[j + 1]
    movq (%r13), %r10
    movq (%r12), %rcx
    cmpq %r10, %rcx
    jl swap

loop2_end:
    incq %r14
    jmp loop2

loop1_end:
    decq %r15
    jmp loop1

swap:
    movq %r10, (%r12)
    movq %rcx, (%r13)
    jmp loop2_end

inter:
    movq $0, %r15
    movq %r8, %r14
loop3:
    cmpq %r14, %rdi
    je flag_true
    # %r11 -> a[0] + x
    # %r10 -> a[n]
    movq (%rsi, %r15, 8), %r11
    movq (%rsi, %r14, 8), %r10
    addq %rdx, %r11
    cmpq %r11, %r10
    jl flag_not_true
    incq %r14
    incq %r15
    jmp loop3

flag_not_true:  
    movq $0, %rax
    ret
flag_true:
    movq $1, %rax
    ret







