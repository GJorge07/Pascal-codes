program registrocomvetores;

type vetor = array[1..1000] of longint;
    registro = record
                tam:longint;
                valores:vetor; {valores do vetor - v[i]}
end;
var r:registro;

procedure levetor(var r:registro);
var i:longint;
begin
    read(r.tam);
    for i:=1 to r.tam do
        read(r.valores[i]);
end;

procedure imprimevetor(var r:registro);
var i:longint;
begin
    for i:=1 to r.tam do
        write(r.valores[i],' ');
end;

begin
    levetor(r);
    imprimevetor(r);
end.