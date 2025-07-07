program quadradolatino;

type matriz = array[1..100,1..100] of longint;
     vetor = array[1..1000] of longint;

var w:matriz;
    n,i,j,k:longint;
    ok:boolean;
    v:vetor;

procedure lematriz(var w:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do 
        for j:=1 to n do
            read(w[i,j]);
end;

function permutacao(var v:vetor;n:longint):boolean;
var i,j,cont:longint;
    achou:boolean;
begin
    permutacao:=false;
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
        permutacao:=true;
end;

begin
    read(n);
    lematriz(w,n);
    ok:=true;
    k:=1;
    for i:=1 to n do
        for j:=1 to n do
        begin
            v[k]:=w[i,j];
            k:=k+1;
        end;
        if not permutacao(v,n) then
        begin
            ok:=false;
        end;
    
    k:=1;
    for j:=1 to n do
        for i:=1 to n do
        begin
            v[k]:=w[i,j];
            k:=k+1;
        end;
        if not permutacao(v,n) then
        begin
            ok:=false;
        end;

    if ok then
        writeln('sim')
    else
        writeln('nao');   
end.