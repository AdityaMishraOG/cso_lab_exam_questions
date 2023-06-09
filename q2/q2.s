.global two
two:
    # %rdi -> n
    # %rsi -> &ans[0]

    # rdx -> index
    # rcx -> value 
    # r15 -> &ans[i]
    movq $0, %rdx
    movq $1, %rcx

loop1:
    cmpq %rdx, %rdi
    je inter1
    leaq (%rsi, %rdx, 8), %r15
    movq %rcx, (%r15)
    incq %rdx
    incq %rcx
    jmp loop1

inter1:
    movq $0, %rdx
    movq $1, %rcx
    movq $1, %r8 # 3-flag

loop2:
    cmpq %rdx, %rdi
    je inter2
    leaq (%rsi, %rdx, 8), %r15
    cmpq $3, %r8
    je divisible_by_three

loop2_end:
    incq %r8
    incq %rdx
    incq %rcx
    jmp loop2

divisible_by_three:
    movq $-1, (%r15)
    movq $0, %r8
    jmp  loop2_end

inter2:
    movq $0, %rdx
    movq $1, %rcx
    movq $1, %r8 # 5-flag   

loop3:
    cmpq %rdx, %rdi
    je inter3
    leaq (%rsi, %rdx, 8), %r15
    cmpq $5, %r8
    je divisible_by_five

loop3_end:
    incq %r8
    incq %rdx
    incq %rcx
    jmp loop3

divisible_by_five:
    movq $-2, (%r15)
    movq $0, %r8
    jmp  loop3_end

inter3:
    movq $0, %rdx
    movq $1, %rcx
    movq $1, %r8 # 15-flag     
loop4:
    cmpq %rdx, %rdi
    je end
    leaq (%rsi, %rdx, 8), %r15
    cmpq $15, %r8
    je divisible_by_fifteen

loop4_end:
    incq %r8
    incq %rdx
    incq %rcx
    jmp loop4

divisible_by_fifteen:
    movq $-3, (%r15)
    movq $0, %r8
    jmp  loop4_end

end:
    movq %rsi, %rax
    ret
    


    



