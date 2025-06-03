program MultiplicacaoVetores;
type vetor=array[1..30] of longint;
var v,w:vetor;
    i:longint;
procedure LeVetor (var v,w:vetor);
var i:longint;
begin
    for i:=1 to 30 do 
    begin
        v[i]:= i*2;  {Valores que eu escolhi pro vetor, mas poderia ser qualquer um}
        w[i]:=i*5;
    end;
end;

function MultiVet(var v,w:vetor):longint;
var i,soma:longint;
begin
    soma:=0;
    for i:=1 to 30 do
        soma:=soma + (v[i] * w[i]);
        MultiVet:=soma;
end;

begin
    for i:=1 to 30 do
    LeVetor(v,w);
    writeln (MultiVet(v,w));
end.