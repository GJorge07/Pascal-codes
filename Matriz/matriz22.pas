program palavrascruzadas;

type matriz = array[1..1000,1..1000] of longint;

var
    w:matriz;
    m,n:longint;


procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

procedure escrevematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
    begin
        for j:=1 to n do
            write(w[i,j],' ');
        writeln;
    end;
end;

procedure iniciodepalavra(var w:matriz; m, n: longint);
var i, j, cont: longint;
begin
    cont := 0;
    for i := 1 to m do
        for j := 1 to n do
            if w[i, j] = 0 then
            begin
            {conta as horizontais}
                if ((j = 1) or (w[i, j-1] = -1)) and (j < n) and (w[i, j+1] = 0) then {se ta na 1 coluna ou c antes n tem letra e se não tá na ultima coluna e dps tem letra}
                begin
                    cont := cont + 1;
                    w[i, j] := cont;
                end
                {conta as verticais}
                else if ((i = 1) or (w[i-1, j] = -1)) and (i < m) and (w[i+1, j] = 0) then {se ta na primeira linha ou se antes n tem letra e se nao ta na ultima linha e dps tem letra}
                begin
                    cont := cont + 1;
                    w[i, j] := cont;
                end;
            end;
end;

begin
    read(m,n);
    lematriz(w,m,n);
    iniciodepalavra(w,m,n);
    escrevematriz(w,m,n);
end.