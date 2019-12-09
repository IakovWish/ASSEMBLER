program SRV;
var A,B,C: integer;
    P: shortint;
begin
     writeln('ENTER A,B,C');
     readln(A,B,C);
     asm
        MOV P, 0
        XOR AX, AX
        CMP A, AX
        JS @m
        CMP B, AX
        JS @m
        CMP C, AX
        JS @m
        INC P
        JMP @s
        @m:
        CMP A, AX
        JNS @s
        CMP B, AX
        JNS @s
        CMP C, AX
        JNS @s
        DEC P
        @s: NOP
     end;
     writeln ('P = ',P);
end.
