program exerciciolivro;

type vetor = array[1..100] of longint;

var v:vetor;
    n,num:longint;

procedure levetor(var v:vetor;var n,num:longint);
var i:longint;
begin
    read(n);
    for i:=1 to n do
    begin
        read(num);
        v[i]:=num;
    end;
end;

function ordenado(var v:vetor;n:longint):boolean;
var i:longint;
begin
    ordenado:=true;
    for i:=1 to n-1 do 
     if v[i] > v[i + 1] then
            ordenado := false;
end;


begin
    levetor(v,n,num);
    if ordenado(v,n) then
        writeln('sim')
    else
        writeln('nao');
end.

{Faça um programa em Pascal que leia um inteiro positivo n e em seguida leia n
valores inteiros quaisquer e imprima sim se o vetor estiver ordenado e nao em
caso contrário. Use ao máximo funções e procedimentos apropriados.}