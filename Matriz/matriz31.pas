program vetorlatino;

type vetor = array[1..1000] of longint;

var v:vetor;
    n,i:longint;
    x:boolean;

function verifica(var v:vetor;n:longint):boolean;
var i,j,cont:longint;
    achou:boolean;
begin
    verifica:=false;
    cont:=0;
    for i:=1 to n do
    begin
        achou:=false;
        for j:=1 to n do
            if v[j]= i  then
                achou:=true;
        if achou  then
            cont:=cont+1;
    end;
    if cont = n then
        verifica:=true;
end;

begin
    read(n);
    for i:=1 to n do
        read(v[i]);
    x:=verifica(v,n);
    if x then
        writeln('sim')
    else
        writeln('nao');
end.