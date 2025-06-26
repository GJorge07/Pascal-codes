program maxpooling;

type matriz = array[1..1000,1..1000] of longint;

var m:matriz;
    n,escolha:longint;

procedure lematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

procedure escrevematriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
            write(m[i,j],' ');
        writeln;
    end;
end;

function maiordos4(var m:matriz;i,j:longint):longint;
var maior:longint;
begin
    maior:=0;
        if m[i,j] > maior then
            maior:= m[i,j];
        if m[i,j+1] > maior then
            maior:=m[i,j+1];
        if m[i+1,j] > maior then
            maior:=m[i+1,j];
        if m[i+1,j+1] > maior then
            maior:=m[i+1,j+1];
        maiordos4:=maior;
end;

procedure tipo1(var m:matriz;n:longint);
var i,j:longint;
    matrizsaida:matriz;
begin
    for i:=1 to n-1 do
        for j:=1 to n-1 do
            matrizsaida[i,j]:=maiordos4(m,i,j);
    escrevematriz(matrizsaida,n-1);
end;

procedure tipo2(var m:matriz;n:longint);
var i,j,ii,jj:longint;
    matrizsaida:matriz;
begin
    i:=1;
    ii:=1;
    while i<= n -1 do 
    begin
    j:=1;
    jj:=1;
        while j<= n-1 do
        begin
            matrizsaida[ii,jj]:=maiordos4(m,i,j);
            j:=j+2;
            jj:=jj + 1;
        end;
        i:=i+2;
        ii:=ii + 1;
    end;
    escrevematriz(matrizsaida,n div 2);
end;
{tem o ii e jj q são indices da matriz nova, pq se n pularia 1,3,5 e ficaria espaço em branco}
begin 
    readln(n);
    readln(escolha);
    lematriz(m,n);
    if escolha = 1 then
        tipo1(m,n)
    else if escolha = 2 then
        tipo2(m,n);
end.