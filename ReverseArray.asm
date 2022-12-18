
 
.MODEL SMALL
.STACK 100h
.DATA        
     ARR  DB   1,2,3,4,5,6,7,8,9,10   ;array declaration
.CODE
main proc

   MOV AX,@DATA
   MOV DS,AX
    
   
    
        
   MOV CX,5
   MOV SI,0 
   MOV AH,2
    
    OUTPUT:
          MOV AX, ARR[SI]   
          PUSH AX
          INC SI 

        LOOP OUTPUT    
    
   MOV CX, 5
   MOV SI, 0
   MOV AH,2
     OUTPUT2:
          MOV AX, ARR[SI]   
          POP AX
          INC SI 

        LOOP OUTPUT2
        
            
MOV AX, 4C00H
INT 21H

 

     MAIN ENDP
END MAIN


