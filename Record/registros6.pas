program ex1livro;

type registro = record 
        nome:string[100];
        DDD:integer;
        telefone:string[100];
    end;
    vetor = array[1..1000] of registro;
var v:vetor;
    r:registro;
    tam:longint;

procedure leregistro(var r:registro);
begin
    with r do
    begin
        readln (nome);
        readln (DDD);
        readln (telefone);
    end;
end;

procedure letodos(var v:vetor);
var i:longint;
begin
    for i:=1 to tam do 
        leregistro(v[i]);
end;

procedure buscaDDD(var v:vetor);
var i:longint;
begin
     for i:=1 to tam do
        if (v[i].DDD = 41) or (v[i].DDD = 21) then
            writeln(v[i].nome);
end;

begin
    readln(tam);   {coloca o readln aq se não dá runtime error}
    letodos(v);
    buscaDDD(v);  
end.








{Declare um vetor em Pascal onde cada elemento é um registro com os campos:
nome (uma string), DDD (um integer ) e um telefone (string). Faça um programa que leia os dados de várias pessoas e imprima todos os nomes dos que
são de Curitiba (DDD 41) ou do Rio de Janeiro (DDD 21).}