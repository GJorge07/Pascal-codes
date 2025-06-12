program escrevesubseq;

const MAX = 100;
      FIM = 0;
    
type vetor = array[1..MAX] of longint;

var v:vetor;
    tam,tamsubseq:longint;

procedure lesubseq(var v:vetor; var tam:longint);
var num:longint;
begin
    tam:=0;
    read(num);
    while (num<>FIM) and (tam<MAX) then
    begin
        tam:=tam + 1;
        v[tam]:= num;
        read(num);
    end;
end;


procedure escreve(var v:vetor;ini,tam:longint);
var
    i, fim: integer;
begin
    fim:= ini + tam - 1;
    for i:= ini to fim do
        write( v[i], ' ' );
    writeln;

end;

procedure escrevesubseq(var v:vetor;tam,tamsubseq:longint);
var
    ini: integer;
begin
    for ini:=1 to tam-tamsubseq+1 do
        escreve( v, ini, tamsubseq );

end;

begin
    lesubseq(v,tam);
    for tamsubseq:=1 to tam do
        escrevesubseq(v,tam,tamsubseq);
end.