program exercicio14;    {nao ficou bem igual, n fiz exatamente oq pediu, mas rodou}

type vetor = array[1..200] of longint;

var v,w,soma_v: vetor;
i,x,tam_v,tam_w:longint;

procedure levetorv(var v:vetor;var tam:longint);
var i,x:integer;
begin
    read(i);
    x:=1;
    tam:=0;
        while i<>0 do
        begin
            v[x]:=i;
            x:=x+1;
            tam:=tam+1;
            read(i);
        end;
end;

procedure levetorw(var w:vetor;var tam:longint);
var i,x:integer;
begin
    read(i);
    x:=1;
    tam:=0;
        while i<>0 do
        begin
            w[x]:=i;
            x:=x+1;
            tam:=tam+1;
            read(i);
        end;
end;

procedure somavetores(var v,w,soma_v:vetor;tam:integer);
var x:integer;
begin   
    for x:=1 to tam do 
        soma_v[x]:= v[x] + w[x];
end;

begin
    levetorv(v,tam_v);
    levetorw(w,tam_w);
    somavetores(v,w,soma_v,tam_w);
    for x:=1 to tam_w do
        writeln(soma_v[x]);
end.


