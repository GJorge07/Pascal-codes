program SaoPares;
const
    MAX=200;
    MIN=1;
type vetor=array[MIN..MAX] of longint;
var v:vetor;
    i:longint;
procedure LeVetor(var v:vetor);
var i:integer;
begin
    for i:=MIN to MAX do
        v[i]:=i;
end;
function eh_par(n:longint):boolean;
begin
    eh_par:=false;
    if n mod 2 = 0 then 
        eh_par:=true;
end;
begin
    for i:=MIN to MAX do 
    begin
    LeVetor(v);
    if eh_par(v[i]) then
        writeln(v[i]);
    end;
end.