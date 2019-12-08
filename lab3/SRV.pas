program SRV;
var A,B,C,P: integer;
begin
     writeln('ENTER A,B,C');
     readln(A,B,C);
     asm
        MOV P, 0
        MOV BX, 1
        MOV AX, A
        IMUL BX
        JS @m
        MOV AX, B
        IMUL BX
        JS @m
        MOV AX, C
        IMUL BX
        JS @m
        INC P
        JMP @s
        @m:
        MOV AX, A
        IMUL BX
        JNS @s
        MOV AX, B
        IMUL BX
        JNS @s
        MOV AX, C
        IMUL BX
        JNS @s
        DEC P
        @s: NOP
     end;
     writeln ('P = ',P);
end.
