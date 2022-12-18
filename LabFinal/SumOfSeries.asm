.MODEL SMALL
 
.STACK 100H

.DATA 


.CODE 
MAIN PROC 

;iniitialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV AX, 2        ; a = 2 FIRST VALUE
MOV BX, 3        ; b = 3 SERIES CONDITION
MOV CX, 0        ; sum = 0

SUMOFSERIES:

ADD CX,AX        ; sum = sum + a
MUL BX           ; a = a*b

CMP AX,486       ; is a == 729?
JLE SUMOFSERIES  ; No? Go to Sum

MOV DX,CX        ; Mov answer 
 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  










