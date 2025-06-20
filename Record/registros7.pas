program ex2livro;

type data = record

    dia,mes,ano:integer;
    end;

type registro = record 
        nome:string[100];
        DDD:integer;
        telefone:string[100];
        data_nascimento:data;
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
        readln (data_nascimento.dia, data_nascimento.mes, data_nascimento.ano);
    end;
end;

procedure letodos(var v:vetor);
var i:longint;
begin
    for i:=1 to tam do 
        leregistro(v[i]);
end;

function mais_jovem(a, b: data): boolean;
begin
    if a.ano > b.ano then
        mais_jovem := true
    else if a.ano < b.ano then
        mais_jovem := false
    else if a.mes > b.mes then
        mais_jovem := true
    else if a.mes < b.mes then
        mais_jovem := false
    else
        mais_jovem := a.dia > b.dia;
end;

procedure imprimemaisnovo(var v:vetor);
var i,pos:integer;
begin
    pos:=1;
    for i:=2 to tam do
    if mais_jovem(v[i].data_nascimento,v[pos].data_nascimento) then
    begin
        pos:=i;
    end;
    writeln(v[pos].nome);
end;

begin
    readln(tam);   {coloca o readln aq se não dá runtime error}
    letodos(v);
    imprimemaisnovo(v);
end.


{Acrescente o campo data_nascimento no tipo do exercício anterior. Este campo
deve ser um registro contendo dia, mês e ano, cada um deles sendo um número
inteiro. Considerarando que o vetor não está ordenado, faça um programa em
Pascal que encontre e imprima o nome do cliente mais jovem.}