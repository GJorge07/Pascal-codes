program SomaVetor;
type vetor=array[1..20] of longint;
var v,w,soma_v:vetor;
    i:longint;
procedure LeVetor (var v,w:vetor);
var i:longint;
begin
    for i:=1 to 20 do 
    begin
        v[i]:= i*2;
        w[i]:=i*5;
    end;
end;

procedure somavetor (var v,w,soma_v:vetor);
var i:longint;
begin
    for i:=1 to 20 do 
        soma_v[i]:= v[i] + w[i];
end;
begin
    LeVetor(v,w);
    somavetor(v,w,soma_v);
    for i:=1 to 20 do 
        writeln(soma_v[i]);
end.