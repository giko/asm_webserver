%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
;
; These labels refer to strings used for output
;
prompt1 db    "Enter a number: ", 0       ; don't forget nul terminator
prompt2 db    "Enter another number: ", 0
outmsg1 db    "You entered ", 0
outmsg2 db    " and ", 0
outmsg3 db    ", the sum of these is ", 0


;
; uninitialized data is put in the .bss segment
;
segment .bss
;
; These labels refer to double words used to store the inputs
;

;
; code is put in the .text segment
;
segment .text
        global  _asm_main
_asm_main:
        enter   0,0               ; setup routine
        pusha
		
		mov eax, prompt1
		call print_string
		
		call read_int

		mov ecx, eax
		mov eax, 0
		fact:
			add eax, ecx
		loop fact
		
		call print_int
		call read_int
		
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


