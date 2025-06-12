program trocaMaior;
const
    MAX = 100;
type
    vetor = array[1..MAX] of integer;
    matriz = array [1..MAX] of vetor;
var
    w:matriz;
    n,m,i,pos:longint;
    v:vetor;

procedure lematriz( var w:matriz; m,n: integer );
var
    i, j: integer;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]); 
end;

procedure troca(var w:matriz;n,pos:longint);
var aux:longint;
begin
    aux:= w[n,n];
    w[n,n]:= w[n,pos];
    w[n,pos]:=aux;
end;

function posmaiorelem(var v:vetor;n:longint):longint;
var i,pos:longint;
begin
    pos:=1;
    for i:=2 to n do
        if v[i]>v[pos] then
            pos:=i;
    posmaiorelem:=pos;
end;

procedure escrevematriz( var w:matriz;m,n: integer );
var
    i,j: integer;
begin
    for i:=1 to m do
    begin
        for j:=1 to n do
            write( w[i,j]:4 );
        writeln;
    end;
end;

begin
    read(m,n);
    lematriz(w,m,n);
    for i := 1 to n do
begin
    for pos := 1 to n do
        v[pos] := w[i, pos]; // Copia a linha i da matriz para o vetor v
    pos := posmaiorelem(v, n);
    troca(w, i, pos);
end;
    escrevematriz(w,m,n);
end.
{escrever um programa que leia uma matriz quadrada de dimensão N e troca o valor da diagonal principal pelo maior elemento da linha correspondente.}