.global five
five:
    # %rdi -> n
    # %rsi -> &arr[0]
    # %rdx -> &ans[0]

    # %r10 -> i
    movq $0, %r10
    # %r8 -> count of 0
    # %r9 -> count of 1
    movq $0, %r8
    movq $0, %r9
    # %r11 -> arr[i]

loop:
    cmpq %r10, %rdi
    je inter
    movq (%rsi, %r10, 8), %r11
    cmpq $0, %r11
    je zero
    jg one

loop_end:
    incq %r10
    jmp loop

zero:
    incq %r8
    jmp loop_end
one:
    incq %r9
    jmp loop_end

inter:
    movq $0, %r10
    # %r11 -> &ans[i]

loop2:
    cmpq %r10, %r8 # till i == number of zeroes
    je loop3
    leaq (%rdx, %r10, 8), %r11
    movq $0, (%r11)
    incq %r10
    jmp loop2

loop3:
    cmpq %r10, %rdi
    je end
    leaq (%rdx, %r10, 8), %r11
    movq $1, (%r11)
    incq %r10
    jmp loop3

end:
    movq %rdx, %rax
    ret




