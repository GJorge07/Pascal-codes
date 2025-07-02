program custodoitinerario;

type matriz = array[1..1000,1..1000] of longint;
     vetor =  array[1..2000] of longint;

var v:vetor;
    m:matriz;
    n,k:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

procedure levetor(var v:vetor;k:longint);
var i:longint;
begin
    for i:=1 to k do
        read(v[i]);
end;

procedure faztudo(var v:vetor;var m:matriz;k:longint);
var i,soma:longint;
begin
    soma:=0;
    for i:=1 to k-1 do
        soma:= soma + m[v[i],v[i+1]];
    writeln(soma);
end;


begin
    read(n);
    lematriz(m,n);
    read(k);
    levetor(v,k);
    faztudo(v,m,k);
end.