program ex1;

type matriz = array[1..1000,1..1000] of longint;

var m:matriz;
    i,j,tam,n:longint;
    achoux:boolean;

procedure ler_matriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m[i,j]);
end;

procedure imprime_matriz(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do
            write(m[i,j],' ');
        writeln;
    end;
end;

procedure inverte_cor(var m:matriz;n:longint);
var i,j,max:longint;
begin
    max:=m[1,1];
    for i:=1 to n do
        for j:=1 to n do
            if m[i,j] > max then
                max:= m[i,j];

    for i:=1 to n do
        for j:=1 to n do
            m[i,j]:= max - m[i,j];
end;

function achar_x(var m:matriz;n,ini_lin,ini_col,tam:longint):boolean;
var i,valor:longint;
begin
    valor:=m[ini_lin,ini_col];
    for i:=1 to tam do
    begin
        if m[ini_lin +i-1,ini_col+i-1] <> valor then
            achar_x:=false;
        if m[ini_lin+i-1,ini_col + tam-i] <> valor then
            achar_x:=false;
    end;
    achar_x:=true;
end; 

begin
    read(n);
    ler_matriz(m,n);
    for tam:=2 to n do
        for i:=1 to n-tam+1 do
            for j:=1 to n-tam+1 do
            begin
                if achar_x(m,n,i,j,tam) then
                    achoux:=true;
            end;
        if achoux then 
            inverte_cor(m,n);

        imprime_matriz(m,n);   
end.
