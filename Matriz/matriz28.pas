program slatmb;

type matriz = array[1..1000,1..1000] of longint;
     vetor = array[1..2000] of longint;

var m:matriz;
    n:longint;
    v:vetor;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

procedure transformaemvetoreordena(var v:vetor;m:matriz;n:longint);
var i,j,k,aux:longint;
begin
    k:=1;
    for i:=1 to n do
        for j:=1 to n do
        begin
            v[k]:=m[i,j];
            k:=k+1;
        end;

    for i:=1 to (n*n) - 1 do
        for j:= i+1 to n*n do
            if v[j] > v[i] then
            begin
                aux:=v[i];
                v[i]:=v[j];
                v[j]:=aux;
            end;

    for i:=1 to n*n do
        writeln(v[i]);
end;

procedure linhas(var m:matriz;var v:vetor;n:longint);
var i,j,k,aux:longint;
begin
    k:=1;
    for i:=1 to n do
        for j:=1 to n do
        begin
            v[k]:=m[i,j];
            k:=k+1;
        end;

    for i:=1 to (n*n) - 1 do
        for j:= i+1 to n*n do
            if v[j] > v[i] then
            begin
                aux:=v[i];
                v[i]:=v[j];
                v[j]:=aux;
            end;
            
    for k:=1 to n*n do
    for i:=1 to n do
        for j:=1 to n do
            if m[i,j] = v[k] then
                writeln(i);
end;

procedure colunas(var m:matriz;var v:vetor;n:longint);
var i,j,k,aux:longint;
begin
    k:=1;
    for i:=1 to n do
        for j:=1 to n do
        begin
            v[k]:=m[i,j];
            k:=k+1;
        end;

    for i:=1 to (n*n) - 1 do
        for j:= i+1 to n*n do
            if v[j] > v[i] then
            begin
                aux:=v[i];
                v[i]:=v[j];
                v[j]:=aux;
            end;

    for k:=1 to n*n do
    for i:=1 to n do
        for j:=1 to n do
            if m[i,j] = v[k] then
                writeln(j);
end;

begin
    read(n);
    lematriz(m,n);
    writeln('elem');
    transformaemvetoreordena(v,m,n);
    writeln('linha');
    linhas(m,v,n);
    writeln('coluna');
    colunas(m,v,n);
end.
{Faça um programa que, dado um inteiro n e uma matriz quadrada de ordem
n, cujos elementos são todos inteiros positivos, imprime uma tabela onde os
elementos são listados em ordem decrescente, aompanhados da indicação de
linha e oluna a que pertenem. Havendo repetições de elementos na matriz, a
ordem é irrelevante}