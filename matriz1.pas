program farmaalg1;

const maxcol = 100;
      maxlin = 100;

type matriz = array[1..maxcol,1..maxlin] of longint;

var w:matriz;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
    begin
        for j:=1 to n do    
            read (w[i,j]);
    end;
end;

function linhanula(var w:matriz; m,n:longint):longint;
var i,j,cont:longint;
begin
    linhanula := 0;
    for i:=1 to m do
    begin
        cont := 0;
        for j:=1 to n do
            if w[i,j] = 0 then
                cont := cont + 1;
        if cont = n then
            linhanula := linhanula + 1;
    end;
end;

function colunanula(var w:matriz; m,n:longint):longint;
var i,j,cont:longint;
begin
    colunanula := 0;
    for j:=1 to n do
    begin
        cont := 0;
        for i:=1 to m do
            if w[i,j] = 0 then
                cont := cont + 1;
        if cont = m then
            colunanula := colunanula + 1;
    end;
end;


begin
    read(m);
    read(n);
    lematriz(w,m,n);
    writeln('linhas:',' ', linhanula(w,m,n));
    writeln('colunas:',' ',colunanula(w,m,n));
end.


{Faça um programa em Free Pascal que leia dois inteiros positivos m e n, sendo 1 ≤ m, n ≤ 100, e uma matriz A m×n . O programa deve imprimir o números de linhas e o número de colunas que são nulas, ou seja, quando todos os elementos de uma linha ou coluna são iguais a 0 (zero).
Nos casos de teste cada elemento x da matriz A é definido por 0 ≤ x ≤ 100.}
