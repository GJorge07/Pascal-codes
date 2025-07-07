program substitui_bloco;

type matriz = array[1..1000,1..1000] of longint;

var n, p, m, o: longint;
    w1, w2: matriz;
    ok: boolean;
    i, j, k, s, bi, bj: longint;

procedure lematriz(var w:matriz; x, y: longint);
var i, j: longint;
begin
    for i := 1 to x do
        for j := 1 to y do
            read(w[i, j]);
end;

procedure imprimematriz(var w:matriz; x, y: longint);
var i, j: longint;
begin
    for i := 1 to x do
    begin
        for j := 1 to y do
            write(w[i, j], ' ');
        writeln;
    end;
end;

begin
    read(n, p);
    lematriz(w1, n, p);
    read(m, o);
    lematriz(w2, m, o);
    ok := false;

    // Procura o primeiro bloco de zeros
    for i := 1 to n - m + 1 do
        for j := 1 to p - o + 1 do
        begin
            ok := true;
            for k := 1 to m do
                for s := 1 to o do
                    if w1[i + k - 1, j + s - 1] <> 0 then
                        ok := false;
            if ok then
            begin
                bi := i; bj := j; // Guarda onde encontrou
                break;
            end;
        end;

    if ok then
    begin
        // Substitui o bloco de zeros por w2
        for k := 1 to m do
            for s := 1 to o do
                w1[bi + k - 1, bj + s - 1] := w2[k, s];
        imprimematriz(w1, n, p);
    end
    else
        writeln('nao eh possivel realizar a operacao');
end.