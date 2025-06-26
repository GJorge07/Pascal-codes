program ordenaegeranova;

type matriz = array[1..100,1..100] of longint;
     vetor = array[1..200000] of longint;
var m1,m2,m3:matriz;
    n:longint;
    v:vetor;

procedure lematriz1(var m1:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do
            read(m1[i,j]);
end;

procedure imprimematriz(var a:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
    begin
        for j:=1 to n do 
            write(a[i,j],' ');
        writeln;
    end;
end;

procedure lematriz2(var m2:matriz;n:longint);
var i,j:longint;
begin
    for i:=1 to n do
        for j:=1 to n do 
            read(m2[i,j]);
end;

procedure transformaeordena(var a:matriz;var v:vetor;n:longint);
var i,j,k,aux,tamvetor:longint;
begin
    tamvetor:=n*n;
    k:=1;
    for i:=1 to n do
        for j:=1 to n do
        begin
                    v[k]:=a[i,j];
                    k:=k+1;
        end;        {transforma matriz em vetor}

    for i:=1 to tamvetor - 1 do
        for j:=i+1 to tamvetor do
            if v[j] < v[i] then
            begin
                aux:=v[i];
                v[i]:=v[j];
                v[j]:=aux;
            end; {ordena o vetor}  


    k:=1;
        for i:=1 to n do
            for j:=1 to n do
            begin
                a[i,j]:=v[k];
                k:=k+1;
            end;   {transforma o vetor em matriz dnv}
        imprimematriz(a,n);
end;

procedure matrizcompletaordenada(var m1,m2,m3:matriz;var v:vetor;n:longint);
var k,cont,tamvetor,i,j,aux:longint;
begin
    tamvetor:=2*n*n;
    k:=1;
    cont:=0;
    for i:=1 to n do
        for j:=1 to n do 
        begin
            v[k]:=m1[i,j];
            k:=k+1;
            cont:=cont+1;
        end;

    k:=cont+1; {pra começar dps do ultimo elemento da m1}
    for i:=1 to n do
        for j:=1 to n do
        begin
            v[k]:=m2[i,j];
            k:=k+1;
        end;

    for i:=1 to tamvetor-1 do
        for j:=i+1 to tamvetor do
            if v[j] < v[i] then
            begin
                aux:=v[i];
                v[i]:=v[j];
                v[j]:=aux;
            end; {ordena o vetor}

    k:=1;
    for i:=1 to n do
        for j:=1 to n*2 do
        begin
            m3[i,j]:=v[k];
            k:=k+1;
        end;   

    for i:=1 to n do
    begin
        for j:=1 to n*2 do
            write(m3[i,j],' ');
            writeln; 
    end;
end;

{coloquei as 2 matrizes em um vetor, ordenei ele e coloquei ele de volta em uma outra matriz contendo tudo}
begin
    read(n);
    lematriz1(m1,n);
    lematriz2(m2,n);
    transformaeordena(m1,v,n);
    transformaeordena(m2,v,n);
    matrizcompletaordenada(m1,m2,m3,v,n);
end.