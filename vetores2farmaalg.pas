program vetores003;
type vetor=array[1..200] of longint;
var n,i:longint;
    v:vetor;
Function OrdemCrescente(var v:vetor;n:integer):boolean;
var i:longint;
begin
OrdemCrescente:=true;
    for i:=1 to n-1 do
        if v[i] > v[i + 1] then
            OrdemCrescente:=false;
end;
procedure OrdemInversa(var v:vetor;n:integer);
var i:longint;
begin
    for i:= n downto 1 do
        write(v[i],' ');
end;
begin
    read(n);
    if n= 0 then
        writeln('vetor vazio')
    else
    begin
        for i:=1 to n do
            read(v[i]);
    if OrdemCrescente(v,n) then
        writeln('sim')
    else 
        writeln('nao');
     OrdemInversa(v,n);
end;
end.
