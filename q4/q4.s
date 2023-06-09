.global four
four:
    # %rdi -> n
    # %rsi -> m
    # %r14 -> n % m
    
recursive_call:
    cmpq $0, %rsi
    je base_case
    movq %rdi, %rax
    movq $0, %rdx
    idivq %rsi 

    movq %rsi, %rdi
    movq %rdx, %rsi
    call recursive_call

base_case:
    movq %rdi, %rax
    ret

