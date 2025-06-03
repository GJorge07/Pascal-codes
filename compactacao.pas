program compactacao;

type
    vetor = array[1..100] of longint;

var
    v: vetor;
    n: longint;

procedure levetor(var v: vetor; var n: longint);
var
    i: longint;
begin
    read(n);
    if n > 0 then
        for i := 1 to n do
            read(v[i]);
end;

procedure escrevevetor(var v: vetor; n: longint);
var
    i: longint;
begin
    write('O ');
    for i := 1 to n do
        write(v[i], ' ');
    writeln;
end;

procedure elimina(var v: vetor; n: longint);
var
    repetido: boolean;
    i, j: longint;
begin
    write('C ');
    for i := 1 to n do
    begin
        repetido := false;
        for j := 1 to i-1 do
            if v[i] = v[j] then
                repetido := true;
        if not repetido then
            write(v[i], ' ');
    end;
    writeln;
end;

begin
    levetor(v, n);
    while n <> 0 do
    begin
        escrevevetor(v, n);
        elimina(v, n);
        levetor(v, n);
    end;
end.