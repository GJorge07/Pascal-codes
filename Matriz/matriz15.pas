program eqlinear;

type matriz = array[1..1000,1..1000] of longint;
     vetor = array[1..1000] of longint;

var m:matriz;
    v1,v2:vetor;
    n,s:longint;

procedure lematriz(var m:matriz;n,s:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to s do
            read(m[i,j]);
end;

procedure levetory(var v1:vetor;n:longint);
var i:longint;
begin
    for i:=1 to n do 
        read(v1[i]);
end;

procedure levetorx(var v2:vetor;s:longint);
var i:longint;
begin
    for i:=1 to s do
        read(v2[i]);
end;

procedure verificacao(var v1,v2:vetor;var m:matriz;n,s:longint);
var i,j:longint;
    soma:longint;
    ok:boolean;
begin
    ok:=true;
    for i:=1 to n do
    begin
        soma:=0;
            for j:=1 to s do
                soma:=soma + (m[i,j] * v2[j]); {pega o primeiro elemento da matriz(primeiro coeficiente da eq) e multiplica pelo primeiro do vetor e assim vai, somando cada multiplicação}
        if soma <> v1[i] then
        ok:=false;
    end;
        if ok then
            writeln('sim')
        else 
            writeln('nao');
end;
{Ax = y, ou seja, fiz A . x e vi se é = a y mesmo ou não}
begin
    read(n,s);
    lematriz(m,n,s);
    levetory(v1,n);
    levetorx(v2,s);
    verificacao(v1,v2,m,n,s);
end.

{Um vetor real x com n elementos é apresentado como resultado de um sistema
de equações lineares Ax = y cujos coeficientes são representados em uma matriz
real An×n e os lados direitos das equações em um vetor real y de n elementos. Faça um programa em Pascal que leia a dimensão n da matriz quadrada,
seus elementos reais, linha por linha, e depois leia o vetor y de n elementos
e finalmente leia o vetor x de n elementos que seria a resposta do sistema de
equações linerares. Seu programa deve verificar se o vetor x é realmente solução
do sistema dado.}