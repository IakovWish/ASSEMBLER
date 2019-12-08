program SRV;
var A,B,C,P: integer;
begin
     writeln('ENTER A,B,C');
     readln(A,B,C);
     asm
        MOV P, 0
        MOV BX, 1
        MOV AX, A
        CMP AX, BX
        JS @m
        MOV AX, B
        CMP AX, BX
        JS @m
        MOV AX, C
        CMP AX, BX
        JS @m
        INC P
        JMP @s
        @m:
        MOV AX, A
        CMP AX, BX
        JNS @s
        MOV AX, B
        CMP AX, BX
        JNS @s
        MOV AX, C
        CMP AX, BX
        JNS @s
        DEC P
        @s: NOP
     end;
     writeln ('P = ',P);
end.
