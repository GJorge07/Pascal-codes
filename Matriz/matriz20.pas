program DATAS;

type matriz = array[1..2000,1..2000] of longint;
     vetor = array[1..10000] of longint;

var m:matriz;
    n:longint;
    v:vetor;
    
procedure lematriz(var m:matriz;n:longint);
var i, j:longint;
begin
    for i:=1 to n do 
        for j:=1 to 3 do
            read(m[i,j]);
end;

procedure transformaemvetor(var m:matriz;var v:vetor;n:longint);
var i,j,k:longint;
begin
    k:=1;
    for i:=1 to n do
        for j:=1 to 3 do
        begin
            v[k]:=m[i,j];
            k:=k+1;
        end;
end;

procedure ordenavetor(var v:vetor;n:longint);
var i,j,aux,aux2,aux3:longint;
begin
    i:=3;
    while i<= (n-1)* 3 do 
    begin
        j:=i+3;
        while j<= n*3 do 
        begin
            if v[j] < v[i] then
            begin
                        aux:=v[i];
                        v[i]:=v[j];
                        v[j]:=aux;

                        aux3:=v[i-1];
                        v[i-1]:=v[j-1];
                        v[j-1]:=aux3;
                        
                        aux2:=v[i-2];
                        v[i-2]:=v[j-2];
                        v[j-2]:=aux2;
            end
            else if v[j] = v[i] then
            begin
                if v[j-1] < v[i-1] then
                begin
                        aux:=v[i];
                        v[i]:=v[j];
                        v[j]:=aux;

                        aux3:=v[i-1];
                        v[i-1]:=v[j-1];
                        v[j-1]:=aux3;
                        
                        aux2:=v[i-2];
                        v[i-2]:=v[j-2];
                        v[j-2]:=aux2;
                end
                else if v[j-1] = v[i-1] then
                begin
                    if v[j-2] < v[i-2] then
                    begin
                        aux:=v[i];
                        v[i]:=v[j];
                        v[j]:=aux;

                        aux3:=v[i-1];
                        v[i-1]:=v[j-1];
                        v[j-1]:=aux3;

                        aux2:=v[i-2];
                        v[i-2]:=v[j-2];
                        v[j-2]:=aux2;

                        
                    end;
                end;
            end;
        j:=j+3;
        end;
    i:=i+3;
    end;
end;

procedure transformaemmatriz(var m:matriz;var v:vetor;n:longint);
var i,j,k:longint;
begin
    k:=1;
    for i:=1 to n do
        for j:=1 to 3 do
        begin
            m[i,j]:=v[k];
            k:=k+1;
        end;
end;

procedure escrevematriznova(var m:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=1 to 3 do
            write(m[i,j],' ');
            writeln;
    end;       
end;

begin
    read(n);
    lematriz(m,n);
    transformaemvetor(m,v,n);
    ordenavetor(v,n);
    transformaemmatriz(m,v,n);
    escrevematriznova(m,n);
end.