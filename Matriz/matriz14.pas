program ex1livro;

type matriz = array[1..1000,1..1000] of longint;

var w:matriz;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin 
    for i:=1 to m do   
        for j:=1 to n do    
            read(w[i,j]);
end;

function linhasnulas(var w:matriz;m,n:longint):longint;
var i,j,cont,linhas:longint;
begin
    linhas:=0;
    for i:=1 to m do
    begin
    cont:=0;
        for j:=1 to n do
            if w[i,j] = 0 then 
                cont:=cont+1;
        if cont = m then
        linhas:=linhas + 1
    end;
    linhasnulas:=linhas
end;

function colunasnulas(var w:matriz;m,n:longint):longint;
var i,j,cont,colunas:longint;
begin
    colunas:=0;
    for j:=1 to n do
    begin
    cont:=0;
        for i:=1 to m do
            if w[i,j] = 0 then 
                cont:=cont+1;
        if cont = n then
        colunas:=colunas + 1
    end;
    colunasnulas:=colunas;
end;

begin
    read(m,n);
    lematriz(w,m,n);
    writeln(linhasnulas(w,m,n));
    writeln(colunasnulas(w,m,n));
end.

{Faça um programa em Pascal que leia dois números inteiros n e m representando
respectivamente o número de linhas e o número de linhas de uma matriz An×m
e em seguida leia os elementos inteiros da matriz. Seu programa deve imprimir
o número de linhas e o número de linhas nulas da matriz. Exemplo: a matriz
abaixo tem duas linhas e uma coluna nulas.}