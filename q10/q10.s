.global ten
ten:
    # %rdi -> n
    # %rsi -> &arr[0]
    # %rdx -> &ans[0]

    # %r15 -> i
    movq $0, %r15
    # %r11 -> total
    movq $0, %r11

# loop1 sets arr[] 

loop1:
    cmpq %r15, %rdi
    je inter
    # %r14 -> &arr[i]
    leaq (%rsi, %r15, 8), %r14

    # %r13 -> n - 1 - i
    movq %rdi, %r13
    decq %r13
    subq %r15, %r13

    cmpq $1, (%r14)
    je element_is_one
    jmp element_is_zero

loop1_end:
    incq %r15
    jmp loop1

element_is_one:
    # %r12 -> new value of arr[i]
    # arr[i] = i - (n - i - 1)
    movq %r15, %r12
    subq %r13, %r12
    movq %r12, (%r14)

    addq %r13, %r11
    jmp loop1_end

element_is_zero:
    # %r12 -> new value of arr[i]
    # arr[i] = (n - i - 1) - i
    movq %r13, %r12
    subq %r15, %r12
    movq %r12, (%r14)

    addq %r15, %r11
    jmp loop1_end

inter:
    # %r15 -> i
    movq %rdi, %r15
    decq %r15
    # initially, i = n - 1


loop2:
    cmpq $0, %r15
    je inter2
    # %r8 -> j set equal to 0
    movq $0, %r8

innerloop:
    cmpq %r8, %r15
    je loop2_end

    # %r9 -> &arr[j]
    # %r10 -> &arr[j + 1]
    leaq (%rsi, %r8, 8), %r9
    movq %r9, %r10
    addq $8, %r10

    # %r13 -> arr[j]
    # %r14 -> arr[j + 1]
    movq (%r9), %r13
    movq (%r10), %r14
    cmpq %r13, %r14
    jg swap

innerloop_end:
    incq %r8
    jmp innerloop

loop2_end:
    decq %r15
    jmp loop2

swap:
    movq %r13, (%r10)
    movq %r14, (%r9)
    jmp innerloop_end

inter2:
    # %r15 -> i
    movq $0, %r15
    

loop3:
    cmpq %r15, %rdi
    je inter3

    # %r14 -> &arr[i]
    leaq (%rsi, %r15, 8), %r14

    cmpq $0, (%r14)
    jg add_to_total

loop3_end:
    # %r13 -> &ans[i]
    leaq (%rdx, %r15, 8), %r13
    movq %r11, (%r13)
    incq %r15
    jmp loop3

add_to_total:
    addq (%r14), %r11
    jmp loop3_end

inter3:
    ret


