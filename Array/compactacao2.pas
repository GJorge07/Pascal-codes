program repetindopraprova;

type vetor = array[1..1000] of longint;

var v:vetor;
    n:longint;

procedure levetor(var v:vetor;var n:longint);
var i:longint;
begin
    read(n);
    for i:=1 to n do
        read(v[i]);
end;

procedure imprimevetor(var v:vetor;n:longint);
var i:longint;
begin
    for i:=1 to n do
        write(v[i],' ');
    writeln;
end;


procedure removedovetor(var v:vetor;x:longint;var n:longint);
var i:longint;
begin
    for i:=x to n do
        v[i]:=v[i+1];
    n:=n-1;
end;

procedure repetidos(var v:vetor; var n:longint);
var i, j: longint;
begin
    i := 1;
    while i <= n do
    begin
        j := i + 1;
        while j <= n do
        begin
            if v[i] = v[j] then
                removedovetor(v, j, n)
            else
                j := j + 1;
        end;
        i := i + 1;
    end;
end;

begin
    levetor(v, n);
    while n <> 0 do
    begin
        write('O:',' ');
        imprimevetor(v, n);
        write('C:',' ');
        repetidos(v, n);
        imprimevetor(v,n);
        levetor(v, n);
    end;
end.