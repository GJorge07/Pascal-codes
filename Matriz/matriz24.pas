program maiorsubmatrizcrescente;

type matriz =array[1..1000,1..1000] of longint;
     vetor = array[1..2000] of longint;

var w:matriz;
    v:vetor;
    m,n:longint;

procedure lematriz(var w:matriz;m,n:longint);
var i,j:longint;
begin
    for i:=1 to m do
        for j:=1 to n do
            read(w[i,j]);
end;

procedure transformaemvetor(var a:matriz;var v:vetor;m,n,tam:longint);
var i,j,k:longint;
begin
    k:=1;
    tam:=0;
    for i:=1 to m do
        for j:=1 to n do
        begin
        v[k]:=a[i,j];
        k:=k+1;
        tam:=tam+1;
        end;
end;

function ecrescente(var v:vetor;tam:longint):boolean;
var i:longint;
begin
    for i:=1 to tam-1 do
        if v[i] > v[i+1] then
        begin
            ecrescente:=false;
            exit;
        end;
    ecrescente:=true;
end;

function maiorsegcrescente(var w:matriz;var v:vetor;m,n:longint):longint;
var i,j,k,s,maiorsub,tam_linha,tam_coluna:longint;
    sub:matriz;
begin
    maiorsub:=0;
    for tam_linha:=1 to m do
        for tam_coluna:=1 to n do 
            for i:=1 to m - tam_linha + 1 do
                for j:=1 to n - tam_coluna + 1 do
                begin
                    for k:=1 to tam_linha do
                        for s:=1 to tam_coluna do
                            sub[k,s]:=w[i+k-1,j+s-1];
                            transformaemvetor(sub,v,tam_linha,tam_coluna,tam_linha*tam_coluna);
                            if ecrescente(v,tam_linha*tam_coluna) then
                               if tam_linha*tam_coluna > maiorsub then
                                    maiorsub:=tam_linha*tam_coluna;
                end;   
    maiorsegcrescente:=maiorsub;                                     
end;


begin
    read(m,n);
    lematriz(w,m,n);
    writeln(maiorsegcrescente(w,v,m,n));
end.