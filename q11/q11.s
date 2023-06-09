.global eleven
eleven:
    # %rdi -> n
    # %rsi -> &arr[0]
    # %r8 -> all_even_flag 
    # %r9 -> denominator for division
    # %r15 -> i
    movq $1, %r8
    movq $2, %r9
    movq $0, %r15

loop1:
    cmpq %r15, %rdi
    je no_sorting_needed
    movq $0, %rdx
    movq (%rsi, %r15, 8), %rax
    idivq %r9
    cmpq $1, %rdx
    je inter
    incq %r15
    jmp loop1

inter:
    # %r8 -> all_odd_flag
    movq $0, %r15
    movq $1, %r8
loop4:
    cmpq %r15, %rdi
    je no_sorting_needed
    movq $0, %rdx
    movq (%rsi, %r15, 8), %rax
    idivq %r9
    cmpq $0, %rdx
    je sorting_needed
    incq %r15
    jmp loop4
sorting_needed:
    movq %rdi, %r15
    decq %r15

loop2:
    cmpq $0, %r15
    je return_part
    movq $0, %r14
loop3:
    cmpq %r14, %r15
    je loop2_end
    leaq (%rsi, %r14, 8), %r13
    movq %r13, %r12
    addq $8, %r12
    movq (%r13), %rdx
    movq (%r12), %rcx
    cmpq %rdx, %rcx
    jl swap
loop3_end:
    incq %r14
    jmp loop3
loop2_end:
    decq %r15
    jmp loop2

swap:
    movq %rdx, (%r12)
    movq %rcx, (%r13)
    jmp loop3_end


no_sorting_needed:
    movq %rsi, %rax
    ret
return_part:
    movq %rsi, %rax
    ret

