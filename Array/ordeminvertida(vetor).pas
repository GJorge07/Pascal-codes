program ordeminvertida;

type vetor = array[1..10] of longint;

var v:vetor;
     n:longint;

procedure levetor(var v:vetor);
var i:longint;
begin
    for i:=1 to 10 do
        read(v[i]);
end;

function OrdemCrescente(var v:vetor):boolean;
var i:longint;
begin
    OrdemCrescente:=true;
    for i:=1 to 9 do
        if v[i+1]<v[i] then
        begin
            OrdemCrescente:=false;
        end;
end;

procedure ordemdecrescente(var v:vetor);
var i:longint;
begin
    for i:=10 downto 1 do
        writeln(v[i]);
end;

procedure ordemcrescente(var v:vetor);
var i:longint;
begin
    for i:=1 to 10 do
        writeln(v[i]);

end;

begin
    levetor(v);
    if OrdemCrescente(v) then
        ordemdecrescente(v)
    else
        ordemcrescente(v);
end.