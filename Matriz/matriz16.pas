program somadosvizinhos;

type matriz = array[1..1000,1..1000] of longint;

var w1,w2:matriz;
    m,n:longint;

procedure lematriz(var w1:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do 
        for j:=1 to n do
            read(w1[i,j]);
end;

procedure transformamatriz(var w1,w2:matriz;m,n:longint);
var i,j:longint; 
begin
    for i:=1 to m do
        for j:=1 to n do
        begin
            w2[i,j]:=w1[i+1,j] + w1[i-1,j] + w1[i,j+1] + w1[i,j-1] + w1[i-1,j-1] + w1[i-1,j+1] +w1[i+1,j+1] +w1[i+1,j-1];
            write(w2[i,j],' ');
        end; 
end;



begin
    read(m,n);
    lematriz(w1,m,n);
    transformamatriz(w1,w2,m,n);
end.

{Faça um programa em Pascal que leia dois números inteiros n e m representando
as dimensões de uma matriz An×m. Em seguida leia os elementos inteiros de
A e imprima uma segunda matriz B de mesmas dimensões de A em que cada
elemento B[i, j] seja constituído pela soma de todos os 8 elementos vizinhos do
elemento A[i, j], excetuando-se o próprio A[i, j]. Observe que alguns elementos
não tem os 8 vizinhos, os que ficam nas bordas e nos cantos têm menos.}