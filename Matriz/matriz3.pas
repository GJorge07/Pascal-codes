program matriztransposta;

type matriz = array[1..100,1..100] of longint;

var w, x: matriz;
    m, n: longint;

procedure lematriz(var w, x: matriz; m, n: longint);
var i, j: longint;
begin
    for i := 1 to m do
        for j := 1 to n do
            read(w[i, j]);
    for i := 1 to n do
        for j := 1 to m do
            read(x[i, j]);
end;

function transposta(var w, x: matriz; m, n: longint): boolean;
var i, j: longint;
begin
    for i := 1 to m do
        for j := 1 to n do
            if w[i, j] <> x[j, i] then  {isso pq se 1 for <>, já n é transposta}
            begin
                transposta := false;
                exit;
            end;
    transposta := true;
end;

begin
    read(m);
    read(n);
    lematriz(w, x, m, n);
    if transposta(w, x, m, n) then
        writeln('sim')
    else
        writeln('nao');
end.