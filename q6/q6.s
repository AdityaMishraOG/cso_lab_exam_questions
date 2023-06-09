.global six
six:
    # %rdi -> n
    # %rsi -> m
    # %r8 -> &arr[0][0]
    movq %rdx, %r8
    # %r14 -> i
    # %r15 -> j
    movq $0, %r14
    movq $0, %r15

    # %r13 -> sum
    movq $0, %r13

    # %r12 -> m* i + j
    # %r11 -> arr[i][j]

    movq $2, %r9
    movq $6, %r10
    
loop1:
    cmpq %r14, %rdi
    je end
    movq $0, %r15

loop2:
    cmpq %r15, %rsi
    je loop1_end

    movq $0, %r12
    addq %rsi, %r12
    imulq %r14, %r12
    addq %r15, %r12
    movq (%r8, %r12, 8), %r11
    jmp condition_check


loop2_end:
    incq %r15
    jmp loop2

loop1_end:
    incq %r14
    jmp loop1


condition_check:
    movq $0, %rdx
    movq %r11, %rax
    idivq %r9
    cmpq $0, %rdx 
    je condition_check2
    jmp loop2_end

condition_check2:
    movq $0, %rdx
    movq %r11, %rax
    idivq %r10
    cmpq $0, %rdx
    jne condition_satisfied
    jmp loop2_end

condition_satisfied:
    addq %r11, %r13
    jmp loop2_end

end:
    movq %r13, %rax
    ret





