program exercicio2farmaalg;

const maxlin = 100;
      maxcol = 100;

type matriz = array[1..maxlin,1..maxcol] of longint;

var m:matriz;
    n:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

function triangular(var m:matriz; n:longint):boolean;
var i,j:longint;
    sup, inf: boolean;
begin
    sup := true;
    inf := true;
    for i := 2 to n do
        for j := 1 to i-1 do   
            if m[i,j] <> 0 then
                sup := false;
    for i := 1 to n-1 do
        for j := i+1 to n do
            if m[i,j] <> 0 then
                inf := false;
    triangular := sup or inf;
end;
{usa j:=i -1 ou j:=i + 1 pela lógica, pra achar os elementos abaixo ou acima da diagonal principal}
begin
    read(n);
    lematriz(m,n);
    if triangular(m,n) then
        writeln('sim')
    else
        writeln('nao');
end.
{Faça um programa em Free Pascal que leia um inteiro positivo n, sendo 1 ≤ m, n ≤ 100, e uma matriz inteira A n×n . O programa deve imprimir “sim” caso a matriz A seja triangular, caso contrário deve imprimir “nao”.
Nos casos de teste cada elemento x da matriz A é definido por 0 ≤ x ≤ 100.}







