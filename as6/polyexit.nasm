; simple modified syscall exit 



;"\x31\xc0"              // xor  %eax,%eax
;"\x40"                  // inc  %eax
;"\x89\xc3"              // mov  %eax,%ebx
;"\xcd\x80"              // int  $0x80
;

global _start 

_start: 


mov al,0x1
cdq
mov ebx,eax
int 0x80


