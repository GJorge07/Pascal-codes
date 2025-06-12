program ocorrencias;

type
    vetor = array[1..100] of longint;

var
    v1, v2: vetor;
    n, m, seq: longint;

procedure levetor(var v1, v2: vetor; var n, m: longint);
var
    i: longint;
begin
    read(n);
    read(m);
    for i := 1 to n do
        read(v1[i]);
    for i := 1 to m do
        read(v2[i]);
end;

function calculo(var v1, v2: vetor; n, m: longint): longint;
var
    i, j: longint;
    igual: boolean;
    cont: longint;
begin
    cont := 0;
    for i := 1 to n - m + 1 do
    begin
        igual := true;
        for j := 1 to m do
            if v1[i + j - 1] <> v2[j] then
                igual := false;
        if igual then
            cont := cont + 1;
    end;
    calculo := cont;
end;

begin
    levetor(v1, v2, n, m);
    seq := calculo(v1, v2, n, m);
    writeln(seq);
end.