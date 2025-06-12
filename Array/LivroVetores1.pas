program ler_imprimir_vetores_v1;
const MAX = 200;
type vetor = array[ 1..MAX] of longint ;
var v: vetor ; tam: longint ;
procedure ler_vetor(var v:vetor;tam:longint);
var i:integer;
begin
     read(tam);
    for i:=1 to tam do 
        read(v[i]);
end;
procedure imprimir_vetor(var v:vetor;var tam:longint);
var i:integer;
begin
    for i:=1 to tam do 
        writeln(v[i],' ');
end;
begin
ler_vetor (v, tam) ;
imprimir_vetor (v,tam) ;
end.