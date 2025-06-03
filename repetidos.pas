program exerciciolivro;

type vetor = array[1..10] of longint;

var v:vetor;
    n:longint;

procedure levetor(var v:vetor;n:longint);
var i:longint;
begin
    read(n);
    for i:=1 to 10 do
    begin
        v[i]:=n;
        read(n);
    end;
end;

procedure repetidos(var v:vetor);
var i, j, k:longint;
    jaImprimiu: boolean;
    achouRepetido: boolean;
begin
    for i := 1 to 10 do
    begin
        achouRepetido := false;

        // Verifica se v[i] se repete em alguma posição seguinte
        for j := i + 1 to 10 do
        begin
            if v[i] = v[j] then
                achouRepetido := true;
        end;

        // Se achou repetição, verifica se já foi impresso
        if achouRepetido then
        begin
            jaImprimiu := false;
            for k := 1 to i - 1 do
            begin
                if v[k] = v[i] then
                    jaImprimiu := true;
            end;

            if not jaImprimiu then
                writeln(v[i]);
        end;
    end;
end;
            
begin
    levetor(v,n);
    repetidos(v);
end.




Faça um programa em Pascal que leia uma sequência de 10 números e os armazene em um vetor de 10 posições. Em seguida imprima a lista de números
repetidos no vetor. Use ao máximo funções e procedimentos adequados.


