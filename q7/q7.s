.global seven
seven:
    # %rdi -> n
    # %rsi -> b
    # %rdx -> &arr[0]
    decq %rdi
    # %r8 -> x (i)
    # %r9 -> y
    # %r10 -> n - 1 - y (j)
    # %r11 -> x + y
    movq $0, %r8
    movq $0, %r9
    movq %rdi, %r10
    movq $0, %r11

    # %r14 -> sum
    movq $0, %r14

loop:
    cmpq %r11, %rsi
    je end

    # %r12 -> arr[i]
    # %r13 -> arr[j]
    movq (%rdx, %r8, 8), %r12
    movq (%rdx, %r10, 8), %r13

    cmpq %r12, %r13
    jl add_front
    jmp add_back

loop_end:
    jmp loop

add_front: 
    addq %r12, %r14
    incq %r8
    incq %r11
    jmp loop_end

add_back:
    addq %r13, %r14
    incq %r9
    decq %r10
    incq %r11
    jmp loop_end

end:
    movq %r14, %rax
    ret



