.global nine
nine:
    # %rdi -> n
    # %rsi -> &arr[0]

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
    # %r15 -> i
    # %r14 -> value, initially equal to 1
    # %r13 -> &arr[i]       
    # 
    movq $0, %r15
    movq $1, %r14
    
loop3:
    cmpq %rdi, %r15
    je did_not_find_one
    leaq (%rsi, %r15, 8), %r13
    cmpq %r14, (%r13)
    jge found_one
    incq %r15
    jmp loop3

did_not_find_one:
    movq $1, %rax
    ret

found_one:
    cmpq %rdi, %r15
    je found_one_return_part
    leaq (%rsi, %r15, 8), %r13 
    cmpq %r14, (%r13)
    jne found_one_return_part
    incq %r15
    incq %r14
    jmp found_one

found_one_return_part:
    movq %r14, %rax
    ret

    







