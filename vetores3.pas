program MenorDeTodos;
const 
     MAX=200;
     MIN=1;
type vetor=array[MIN..MAX] of longint;
var v:vetor;
tam:longint;
procedure LeVetor(var v:vetor;tam:integer);
var i:integer;
begin
    for i:=MIN to tam do
        read(v[i]); 
end;
function LeMenor(v:vetor;tam:integer):longint;
var i:integer;
    menor:integer;
begin
    menor:=v[MIN];
    for i:=MIN to tam do 
        if v[i] < menor then
            menor:=v[i];
        LeMenor:=menor;
end;
begin
    read(tam);
    LeVetor(v,tam);
    writeln (LeMenor(v,tam));
end.