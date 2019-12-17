program NAIB;
uses crt;
const N = 10;
var A: array[1..N] of integer;
i: 1..N;
Count, Max: integer;
begin
     Randomize;
     writeln(' ');
     write('MASSIVE:');
     for i := 1 to N do
     begin
          A[i] := random(10);
          Write(A[i]: 6);
     end;

     asm
        LEA SI, A
        MOV AX, [SI]
        MOV DX, 1
        MOV CX, N
        DEC CX
        ADD SI, 2
    @1: CMP AX, [SI]
        JNE @2
        INC DX
        JMP @3
    @2: JG @3
        MOV AX, [SI]
        MOV DX, 1
    @3: ADD SI, 2
        LOOP @1
        MOV Count,DX
        MOV Max, AX
     end;
     writeln('');
     Writeln('The maximum element of the array is ',Max,' and occurs ',Count,' times');
     writeln('');
end.
