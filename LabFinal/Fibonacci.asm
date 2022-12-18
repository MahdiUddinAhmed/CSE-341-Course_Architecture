.MODEL SMALL
 
.STACK 100H

.DATA 

 STRING0 DB 'Sample Input $'
 STRING2 DB 'Sample output $'
.CODE 

    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX  
        
        LEA DX, STRING0  ; print output  
        MOV AH,9
        INT 21H  
        
        
        MOV AH, 2  
        MOV DL,0AH    ;NEW LINE
        INT 21H
        MOV DL,0DH 
        INT 21H   
        
  
        MOV AH,1
        INT 21H
        SUB AL,30H 
        MOV CL,AL    ;INPUT
        MOV CH,0     ; cx configuration
        MOV SI,0 
        
                
        MOV AH, 2  
        MOV DL,0AH    ;NEW LINE
        INT 21H
        MOV DL,0DH 
        INT 21H   
        
        
        LEA DX, STRING2  
        MOV AH,9    ; nth term
        INT 21H  
        
 
           
        
        MOV AX,0     ; a = 0
        MOV BX,1     ; b = 1
        CMP CX,00H
        JE EXIT         ;INVALID
        CMP CX,001H     ; if n == 1 -> print 0
        JE P1
        CMP CX,002H  ; if n == 2 -> print 1
        JE P2 
        SUB CX,2     ; if c>2, c-2   
           
 

      LOOP1:   
        
        
        MOV DX, BX   ; temp = b
        ADD BX,AX    ; b = b+a
        MOV AX,DX    ; a = b
        PUSH AX      ; store a to keep unchanged

        INC SI       ; count ++
        CMP CX,SI    ; if count = c
     JNE LOOP1       ; else
     
        
        MOV AH, 2  
        MOV DL,0AH    ;NEW LINE
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
        MOV AH,2
        ADD BX,30H   ; print nth term
        MOV DX,BX
        INT 21h
        JMP EXIT  
        
      P1:
        MOV AH, 2  
        MOV DL,0AH    ;NEW LINE
        INT 21H
        MOV DL,0DH 
        INT 21H 
        
          
        PUSH AX       ; STORE UP A CUZ AH
        MOV AH,2     
        POP DX        ; D = A
        ADD DX,23H    ; PRINT 0TH
        INT 21h
        JMP EXIT
      P2:
      
        MOV AH, 2  
        MOV DL,0AH    ;NEW LINE
        INT 21H
        MOV DL,0DH 
        INT 21H
        
        MOV AH,2
        ADD BX,23H    ; PRINT 1ST
        MOV DX,BX
        INT 21h  
        JMP EXIT
         
         
 EXIT:
         MOV AH,4CH
         MAIN ENDP
     END MAIN
  










