program pfinal;

type matriz = array[1..1000,1..1000] of longint;

var w:matriz;
    n,i,j,max,aux,pos_maior:longint;

procedure lematriz(var w:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do 
        for j:=1 to n do
            read(w[i,j]); 
end;

procedure imprimematriz(var w:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
            write(w[i,j],' ');
        writeln;
    end;
end;

begin
    read(n);
    lematriz(w,n);
    for i:=1 to n do
    begin
        max := w[i,1];
        pos_maior := 1;
        for j := 2 to n do
            if w[i,j] > max then
            begin
                max := w[i,j];
                pos_maior := j;
            end;
        aux := w[i,i];
        w[i,i] := w[i,pos_maior];
        w[i,pos_maior] := aux;
    end;
    imprimematriz(w,n);
end.

{escrever um programa que leia uma matriz quadrada de dimensão N e troca o valor da diagonal principal pelo maior elemento da linha correspondente.}