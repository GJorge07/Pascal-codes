program ex4farmaalg;

type vetor = array[1..200] of real;

var v:vetor;
    codigo,tam,i:longint;

function procurarmenor(var v:vetor; p:real;tam:longint):longint;
var i:longint;
begin
    i := 1;
    while (i <= tam) and (v[i] < p) do
        i := i + 1;
    procurarmenor := i;
end;

procedure imprime_vetor(var v:vetor; tam:longint);
var i:longint;
begin
    if tam = 0 then
        writeln('vazio')
    else
    begin
        for i := 1 to tam-1 do
            write(v[i]:0:1, ' ');
        writeln(v[tam]:0:1);
    end;
end;

function busca(var v:vetor; p:real; tam:longint):longint;
var i:longint;
begin
    busca := 0; 
    for i:=1 to tam do 
        if v[i] = p then
        begin
            busca := i;
            exit;
        end;
end;

procedure insercao(var v:vetor; var tam:longint);
var i:longint; p:real; achou:longint;
begin
    read(p);
    if tam = 200 then
    begin
        writeln('erro');
        exit;
    end;
    achou := procurarmenor(v, p, tam);
    for i := tam downto achou do
        v[i+1] := v[i];
    v[achou] := p;
    tam := tam + 1;
    imprime_vetor(v,tam);
end;

procedure remocao(var v:vetor; var tam:longint);
var i:longint; p:real; achou:longint;
begin
    read(p);
    achou := busca(v, p, tam);
    if achou = 0 then
    begin
        writeln('erro');
        exit;
    end;
    for i := achou to tam-1 do
        v[i] := v[i+1];
    tam := tam - 1;
    imprime_vetor(p,tam);
end;

begin
    tam := 0;
    read(codigo);
    while codigo <> 0 do
    begin
        while (codigo <> 0) and (codigo <> 1) and (codigo <> 2) do
        begin
            writeln('erro');
            read(codigo);
        end;
        if codigo = 1 then
            insercao(v, tam)
        else if codigo = 2 then
            remocao(v, tam);
        read(codigo);
    end;

    if tam > 200 then
        writeln('erro')
    else if tam = 0 then
        writeln('vazio')
    else
        for i := 1 to tam do
            write(v[i]:0:1);
            writeln;
end.


{Faça um programa que leia uma sequência de códigos de operação e valor, onde o código de operação é um inteiro com os seguintes valores:

0 (zero): fim
1 (um): inserção
2 (dois): remoção

O valor lido é um número real que deve ser inserido em um vetor (caso a operação seja 1), ou removido do vetor (caso a operação seja 2). As
inserções no vetor devem ser realizadas de forma que o vetor esteja sempre ordenado. O programa deve imprimir todos os vetores resultantes de cada operação e ao final deve imprimir o vetor resultante. Imprima os valores reais sempre com uma casa decimal. Caso o vetor esteja vazio, imprima a mensagem "vazio".

Detalhamento:

A quantidade máxima de valores que pode ser inserida é 200;

Se a quantidade máxima for ultrapassada o programa deve dar uma mensagem de erro (imprima a mensagem "erro");

Se for requisitada a remoção de um número não existente o programa deve dar uma mensagem de erro (imprima "erro");

Se o código de operação for inválido o programa deve continuar lendo um novo código até que ele seja 0 (zero), 1 (um) ou 2 (dois).

Use ao máximo funções e procedimentos apropriados.}