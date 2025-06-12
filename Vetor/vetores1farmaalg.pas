program vetores001;

const
    MAX = 200;

type
    vetor = array[0..MAX] of real;

var
    v: vetor;
    n, i: integer;
    somaPosPar, somaNegImpar: real;

begin
    read(n);
    if n = 0 then
        writeln('vetor vazio')
    else if (n >= 0) and (n <= 200) then
    begin
        // Leitura dos valores
        for i := 0 to n - 1 do
            read(v[i]);

        somaPosPar := 0;
        somaNegImpar := 0;

        for i := 0 to n - 1 do
        begin
            if ((i+1) mod 2 = 0) and (v[i] > 0) then
                somaPosPar := somaPosPar + v[i]
            else if ((i+1) mod 2 = 1) and (v[i] < 0) then
                somaNegImpar := somaNegImpar + v[i];
        end;

        // Evita divisão por zero
        if somaNegImpar = 0 then
            writeln('divisao por zero')
        else
            writeln(somaPosPar / somaNegImpar :0:2);
    end;
end.