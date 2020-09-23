global find_word
extern string_equals
extern _colon_1

section .text

; rdi -- ptr to key
; rsi -- ptr to last word in dict
find_word:
  mov r9, rsi
  mov r10, _colon_1
.loop:
  mov rsi, r13
  add rsi, 8
  call string_equals
  test rax, rax
  jnz .exit
  cmp r10, r9
  je .return_0
  mov r10, [r10]
  jmp .loop
.return_0:
  xor r10, r10
.exit:
  mov rax, r10
  ret

