program SRV;
var A,B,C,P: integer;
begin
     writeln('ENTER A,B,C');
     readln(A,B,C);
     asm
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
        MOV P, 1
        JMP @s
        @m:
        MOV AX, A
        IMUL BX
        JNS @r
        MOV AX, B
        IMUL BX
        JNS @r
        MOV AX, C
        IMUL BX
        JNS @r
        MOV P, -1
        JMP @s
        @r: MOV P, 0
        @s: NOP
     end;
     writeln ('P = ',P);
end.