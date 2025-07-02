program repetindopraprova;

type vetor = array[1..1000] of longint;

var v1,v2:vetor;
    m,n:longint;

procedure levetor(var v:vetor;x:longint);
var i:longint;
begin
    for i:=1 to x do
        read(v[i]);
end;

function contem(var v1, v2: vetor; n, m: longint): longint;
var i, j, cont, x: longint;
begin
    x := 0;
    for i := 1 to n - m + 1 do
    begin
        cont := 0;
        for j := 1 to m do
            if v1[i + j - 1] = v2[j] then
                cont := cont + 1;
        if cont = m then
            x := x + 1;
    end;
    contem := x;
end;

begin
    read(n,m);
    levetor(v1,n);
    levetor(v2,m);
    writeln(contem(v1,v2,n,m));
end.

{Fazer um programa em Free Pascal que leia do teclado dois números naturais 0 < n, m ≤ 100. Em seguida, leia duas sequências de respectivamente n e m números também naturais, sendo garantidamente m < n.
Seu programa deve determinar quantas vezes a segunda sequência ocorre na primeira.}