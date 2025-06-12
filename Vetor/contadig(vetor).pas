program contadig;

const MIN = 0;
      MAX = 100;

type  vetor = array[MIN..MAX] of longint;

var n:longint;
    v:vetor;

procedure zeravetor(var v: vetor);
var i:longint;
begin
    for i:=MIN to MAX do
        v[i]:= 0;
end;

procedure contagem(n:longint;var v:vetor);
var digito:longint;
begin
    while n>0 do 
    begin
        digito:= n mod 10;
        v[digito]:=  v[digito] + 1;
        n:= n div 10;
    end;
end;

procedure escrevecontagem(var v:vetor);
var i: longint;
begin
        for i:=MIN to MAX do
        if v[i] > 0 then
            writeln(v[i],'vezes',' ', i);
end;

begin
    read(n);
    writeln('Você digitou: ', n);
    zeravetor(v);
    contagem(n,v);
    escrevecontagem(v);
end.