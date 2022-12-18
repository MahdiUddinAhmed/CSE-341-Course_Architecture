;MAHDI UDDIN AHMED 20301469
.MODEL SMALL
.STACK 100h
.DATA        
     ARR1  DB 100 DUP(?) ,  ;array declaration         
     ARR2  DB 100 DUP(?)  
     STRING0 DB 'Enter String $' 
     STRING1 DB 'String is Palindrome', '$'
     STRING2 DB 'String is not Palindrome', '$'
     STRING3 DB 'Enter String Length$' 
.CODE
main proc

   MOV AX,@DATA
   MOV DS,AX

   LEA DX, STRING3  
   MOV AH,9
   INT 21H  
    
    
   MOV AH, 2  
   MOV DL,0AH    ;NEW LINE
   INT 21H
   MOV DL,0DH 
   INT 21H   
                 ;STRING  lENGTH
   MOV AH,1
   INT 21H
   SUB AL, 30H
   MOV CH, 0     ;COUNTER 
   MOV CL,AL
   MOV BL, CL  
              
              
   MOV AH, 2  
   MOV DL,0AH    ;NEW LINE
   INT 21H
   MOV DL,0DH 
   INT 21H   
         
   LEA DX, STRING0    ;
   MOV AH,9
   INT 21H  
    
   MOV AH, 2  
   MOV DL,0AH    ;NEW LINE
   INT 21H
   MOV DL,0DH 
   INT 21H           

   MOV CL,BL
   MOV SI, 0  
    
   INPUT:     ;STRING INPUT
    
   MOV AH,1
   INT 21H
   MOV ARR1[SI],AL   
   
   MOV AH, 2     ;SPACE
   MOV DL,20H 
   INT 21H         
    
   INC SI
   LOOP INPUT
    
   MOV AH, 2  
   MOV DL,0AH    ;NEW LINE
   INT 21H
   MOV DL,0DH 
   INT 21H
   
                 
   MOV CL,BL
   MOV SI,0 
   MOV AH,2
                 ;STACK
   STACKPUSH:
       MOV AX, ARR1[SI]   
       PUSH AX
       INC SI 

       LOOP STACKPUSH   
    
   MOV CL,BL
   MOV SI, 0
   MOV AH,2  
   
   REVERSE:      ;REVERSE THE STRING
         
          POP DX
          MOV ARR2[SI], DX
          INC SI
          MOV AH,2
          INT 21H 
          
             
          MOV AH, 2     ;SPACE
          MOV DL,20H 
          INT 21H    

          LOOP REVERSE
 
  
 MOV AH, 2  
 MOV DL,0AH    ;NEW LINE
 INT 21H
 MOV DL,0DH
 INT 21H
    

        
 MOV CL,BL
 MOV SI, 0
 MOV AH,2  
   
   
 MOV AH, 2  
 MOV DL,0AH    ;NEW LINE
 INT 21H
 MOV DL,0DH
 INT 21H
 
                       ; COMPARE OG WITH REVERESE 
PALINDROME: 
            MOV AL, ARR1[SI] 
            MOV BL, ARR2[SI]     
            CMP AL,BL
            JNE NP
            INC SI 
            LOOP PALINDROME    
            
            LEA DX, STRING1  
            MOV AH,9
            INT 21H 
            JMP EXIT
           
NP:                 ;IF NOT PALINDROME
     LEA DX, STRING2  
     MOV AH,9
     INT 21H  
     JMP EXIT

     


EXIT:
MOV AX, 4C00H
INT 21H

 

     MAIN ENDP
END MAIN




