program maisrepetem;

type matriz = array[1..1000,1..1000] of longint;

var w:matriz;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

function liniguais(var w: matriz; m, n: longint; 
                   var lin_ini, col_ini, lin_fim, col_fim: longint): longint;
var i, j, cont, max, ini: longint;
begin
    max := 0;
    for i := 1 to m do
    begin
        cont := 1;
        ini := 1;
        for j := 2 to n do
        begin
            if w[i, j] = w[i, j - 1] then
                cont := cont + 1
            else
            begin
                cont := 1;
                ini := j;
            end;
            if cont > max then
            begin
                max := cont;
                lin_ini := i;
                col_ini := ini;
                lin_fim := i;
                col_fim := j;
            end;
        end;
    end;
    liniguais := max;
end;

function coliguais(var w: matriz; m, n: longint; 
                   var lin_ini, col_ini, lin_fim, col_fim: longint): longint;
var i, j, cont, max, ini: longint;
begin
    max := 0;
    for j := 1 to n do
    begin
        cont := 1;
        ini := 1;
        for i := 2 to m do
        begin
            if w[i, j] = w[i - 1, j] then
                cont := cont + 1
            else
            begin
                cont := 1;
                ini := i;
            end;
            if cont > max then
            begin
                max := cont;
                lin_ini := ini;
                col_ini := j;
                lin_fim := i;
                col_fim := j;
            end;
        end;
    end;
    coliguais := max;
end;

begin
    read(m, n);
    lematriz(w, m, n);

    // Para linhas
    tam := liniguais(w, m, n, lin_ini, col_ini, lin_fim, col_fim);
    maior := tam;
    writeln('Maior sequencia em linha: ', maior);
    writeln('De (', lin_ini, ',', col_ini, ') ate (', lin_fim, ',', col_fim, ')');

    // Para colunas
    tam := coliguais(w, m, n, lin_ini, col_ini, lin_fim, col_fim);
    if tam > maior then
    begin
        maior := tam;
        writeln('Maior sequencia em coluna: ', maior);
        writeln('De (', lin_ini, ',', col_ini, ') ate (', lin_fim, ',', col_fim, ')');
    end;
end.