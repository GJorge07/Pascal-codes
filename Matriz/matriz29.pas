program provap3;

type
    matriz = array[1..20,1..20] of longint;

var w: matriz;
    m, n: longint;

function soma_submatriz(var w: matriz; li, ci, lf, cf: longint): longint;
var s, i, j: longint;
begin
    s := 0;
    for i := li to lf do
        for j := ci to cf do
            s := s + w[i, j];
    soma_submatriz := s;
end;

procedure verifica(var w: matriz; m, n: longint);
var
    tam_linha1, tam_coluna1, tam_linha2, tam_coluna2: longint;
    i1, j1, i2, j2, i3, j3, i4, j4: longint;
    soma1, soma2, total: longint;
    achou: boolean;
begin
    achou := false;
    // Soma total da matriz
    total := 0;
    for i1 := 1 to m do
        for j1 := 1 to n do
            total := total + w[i1, j1];

    // Para cada tamanho possível da submatriz 1
    for tam_linha1 := 1 to m do
        for tam_coluna1 := 1 to n do
            // Para cada posição possível da submatriz 1
            for i1 := 1 to m - tam_linha1 + 1 do
                for j1 := 1 to n - tam_coluna1 + 1 do
                begin
                    i2 := i1 + tam_linha1 - 1;
                    j2 := j1 + tam_coluna1 - 1;
                    // Para cada tamanho possível da submatriz 2
                    for tam_linha2 := 1 to m - i2 do
                        for tam_coluna2 := 1 to n - j2 do
                            // Para cada posição possível da submatriz 2 (começando no canto inferior direito da submatriz 1)
                            for i3 := i2 to m - tam_linha2 + 1 do
                                for j3 := j2 to n - tam_coluna2 + 1 do
                                begin
                                    i4 := i3 + tam_linha2 - 1;
                                    j4 := j3 + tam_coluna2 - 1;
                                    // Garante que submatriz 2 não é igual à submatriz 1
                                    if (i3 > i2) or (j3 > j2) then
                                    begin
                                        soma1 := soma_submatriz(w, i1, j1, i2, j2);
                                        soma2 := soma_submatriz(w, i3, j3, i4, j4);
                                        if soma1 + soma2 = total - soma1 - soma2 then
                                        begin
                                            writeln('sim');
                                            exit;
                                        end;
                                    end;
                                end;
                end;
    writeln('nao');
end;

procedure lematriz(var w: matriz; m, n: longint);
var
    i, j: longint;
begin
    for i := 1 to m do
        for j := 1 to n do
            read(w[i, j]);
end;

begin
    read(m, n);
    lematriz(w, m, n);
    verifica(w, m, n);
end.


{faça um progama em pascal que leia uma matriz MxN. se voce tem uma submatriz que, junto com outra submatriz que começa no canto inferior direito da primeira, somadas, sao igual ao restante dos numeros da matriz principal que nao fazem parte das submatrizes, digite sim. caso contrario, digite nao}

{forma que a professora fez:}

program provap3;

type
    matriz = array[1..20,1..20] of longint;

var w: matriz;
    m, n: longint;

procedure lematriz(var w: matriz; m, n: longint);
var
    i, j: longint;
begin
    for i := 1 to m do
        for j := 1 to n do
            read(w[i, j]);
end;

function soma_submatriz(var w:matriz;linini,colini,linfim,colfim):longint;
var i,j,s:longint;
begin
    s:=0;
    for i:= linini to linfim do
        for j:=colini to colfim do
            s:=s + m[i,j];
    soma_submatriz:=s;
end;

begin
    read(m, n);
    lematriz(w, m, n);
    somatotal:=soma_submatriz(w,1,1,m,n);
    for i:=1 to m do
        for j:=1 to n do
        begin
        s1:=soma_submatriz(w,1,1,i,j);    
        s2:=soma_submatriz(w,i,j,m,n);
        somasub:=s1+s2-m[i,j];
        if somasub = somatotal - somasub then
            writeln(i,' ',j);
        end;
end.
    
