program comparaseq;

const MIN =1;
      MAX = 100;

type vetor = array[MIN..MAX] of longint;

var v1,v2:vetor;
    iguais,invertido,multiplos,n:longint;

procedure levetor(var v:vetor;tam:longint);
var i:longint;
begin
    for i:= MIN to tam do
        read (v[i]);
end;

procedure comparavetor(var v1,v2:vetor; tam:longint; var iguais,invertido,multiplos:longint);
var i:longint;
begin
    iguais:=0;
    invertido:=0;
    multiplos:=0;
        for i:=1 to tam do
        begin
            if v1[i] = v2[i] then
                iguais:=iguais +1
            else if (v1[i] mod v2[i] = 0) or (v2[i] mod v1[i] = 0) then
                multiplos:=multiplos+1;
            if v1[i] = v2[tam-i+1] then
                invertido:=invertido+1;
        end;
end;

begin
    read(n);
    levetor(v1,n);
    levetor(v2,n);
    comparavetor(v1,v2,n,iguais,invertido,multiplos);
        writeln(iguais,'iguais');
        writeln(invertido,'invertido');
        writeln(multiplos,'multiplos');
end.




