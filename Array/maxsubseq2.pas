program repetindopraprova;

type vetor = array[1..1000] of longint;

var v:vetor;
    n:longint;

procedure levetor(var v:vetor;n:longint);
var i:longint;
begin
    for i:=1 to n do
        read(v[i]);
end;

function maxsubseq(var v:vetor;n:longint):longint;
var i,j,soma,max:longint;
begin
    max:=v[1];
    for i:=1 to n do
    begin
        soma:=0;
            for j:=i to n do
            begin
                soma:=soma + v[j];
                if soma>max then   
                    max:=soma
            end;
    end;
    maxsubseq:=max;
end;

begin
    read(n);
    levetor(v,n);
    maiorsoma:=maxsomasubseq(v,n);
    writeln(maiorsoma);
end.