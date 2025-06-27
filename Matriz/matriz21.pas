program dama;

type matriz = array[1..1000,1..1000] of longint;

var m:matriz;

procedure lematriz(var m:matriz);
var i,j:longint;
begin
    for i:=1 to 8 do
        for j:=1 to 8 do
            read(m[i,j]);
end;

procedure podemtomarbrancas(var m:matriz);
var i,j,cont:longint;
begin
    cont:=0;
    for i:=1 to 7 do
    begin
        for j:=1 to 8 do
            if m[i,j] = -1 then
            begin
                if (m[i+1,j-1] = 1) or (m[i+1,j+1] = 1) then
                    if (m[i+2,j-2] = 0) and (m[i+2,j+2] = 0) then
                    begin
                        write(i,'-',j,' ');
                        cont:=cont+1;
                        end;
            end;
    end;
    if cont = 0 then
        write('0');
end;

procedure naopodemtomarbranca(var m:matriz);
var i,j,cont:longint;
begin
    cont:=0;
    for i:=1 to 7 do
    begin
        for j:=1 to 8 do
            if m[i,j] = -1 then
            begin
                if (m[i+1,j-1] = 0) or (m[i+1,j+1] = 0) then
                begin
                    write(i,'-',j,' ');
                    cont:=cont+1;
                end;
            end;
    end;
    if cont = 0 then
        write('0');    
end;

procedure naopodesemover(var m:matriz);
var i,j,cont:longint;
begin
    cont:=0;
    for i:=1 to 7 do 
    begin
        for j:=1 to 8 do
            if m[i,j] = -1 then
            begin
                if (m[i+1,j-1] = -1) and (m[i+1,j+1] = -1) then
                begin
                    write(i,'-',j,' ');
                    cont:=cont+1;
                    end;
            end;
    end;
    if cont = 0 then
        write('0');
end;

begin
    lematriz(m);
    write('tomar:',' ');
    podemtomarbrancas(m);
    writeln;
    write('mover:',' ');
    naopodemtomarbranca(m);
    writeln;
    write('ficar:',' ');
    naopodesemover(m);
    writeln;
end.
{falta arrumar preferencia de tomar sobre mover}