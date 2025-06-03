program ImprimeContrario;
const 
    MAX=200;
    MIN=1;
type vetor = array[1..200] of longint;
var v:vetor;
    n:integer;
procedure LeVetor(var v:vetor);
var i:integer;
begin
    for i:= MIN to MAX do 
        v[i]:=i;
end;
procedure LeContrario(var v:vetor);
var i:integer;
begin
    for i:=MAX downto MIN do 
        write(v[i], ' ');
end;
begin
    LeVetor(v);
    LeContrario(v);
end.