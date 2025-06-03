program maxsomasubseq;

const
    MAX = 100;

type
    vetor = array[1..MAX] of longint;

var
    v: vetor;
    n, maxsoma: longint;

procedure le_vetor(var v: vetor; var n: longint);
var
    i: longint;
begin
    read(n);
    for i := 1 to n do
        read(v[i]);
end;

function max_subseq_soma(var v: vetor; n: longint): longint;
var
    i, j, soma, max: longint;
begin
    max := v[1];
    for i := 1 to n do
    begin
        soma := 0;
        for j := i to n do
        begin
            soma := soma + v[j];
            if soma > max then
                max := soma;
        end;
    end;
    max_subseq_soma := max;
end;

begin
    le_vetor(v, n);
    maxsoma := max_subseq_soma(v, n);
    writeln(maxsoma);
end.



{Vamos ver alguns ciclos principais:
i = 1:
soma = 0
j = 1: soma = 5 → max = 5
j = 2: soma = 5+2 = 7 → max = 7
j = 3: soma = 7+(-2) = 5
j = 4: soma = 5+(-7) = -2
j = 5: soma = -2+3 = 1
j = 6: soma = 1+14 = 15 → max = 15
j = 7: soma = 15+10 = 25 → max = 25
j = 8: soma = 25+(-3) = 22
j = 9: soma = 22+9 = 31 → max = 31
j = 10: soma = 31+(-6) = 25
j = 11: soma = 25+4 = 29
j = 12: soma = 29+1 = 30

i = 2:
soma = 0
j = 2: soma = 2
j = 3: soma = 2+(-2) = 0
j = 4: soma = 0+(-7) = -7
j = 5: soma = -7+3 = -4
j = 6: soma = -4+14 = 10
j = 7: soma = 10+10 = 20
j = 8: soma = 20+(-3) = 17
j = 9: soma = 17+9 = 26
j = 10: soma = 26+(-6) = 20
j = 11: soma = 20+4 = 24
j = 12: soma = 24+1 = 25}