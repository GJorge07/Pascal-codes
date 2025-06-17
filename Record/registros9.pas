program ex4livro;

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

procedure lenovo(var r:registro);
begin
    with r do
    begin
        readln (nome);
        readln (DDD);
        readln (telefone);
        readln (data_nascimento.dia, data_nascimento.mes, data_nascimento.ano);
    end;
end;
    

procedure ordenanome(var v:vetor;tam:longint);
var i,j:longint;
    aux:registro;
begin
    for i:=1 to tam-1 do 
        for j:=i+1 to tam  do
            if v[i].nome > v[j].nome then {em pascal já compara letra por letra fazendo isso}
                begin
                    aux:=v[i];  
                    v[i]:=v[j];
                    v[j]:=aux;
                end; {trocou todas as informações de tal pessoa de lugar}
end;

procedure imprimetudo(var v:vetor;tam:longint);
var i:longint;
begin
    for i:=1 to tam do
        writeln(v[i].nome,' ',v[i].DDD,' ',v[i].telefone,' ', v[i].data_nascimento.dia,'/',v[i].data_nascimento.mes,'/',v[i].data_nascimento.ano);
end;


begin
    readln(tam);   {coloca o readln aq se não dá runtime error}
    letodos(v);
    lenovo(r);
    tam:=tam+1;
    v[tam]:=r;
    ordenanome(v,tam);
    imprimetudo(v,tam);
end.


{Considerando ainda a mesma estrutura de dados do exercício anterior, faça um
programa que leia nome, DDD, telefone e data de nascimento de outra pessoa
e insira estes dados no vetor, lembrando que ele já está ordenado por ordem
alfabética por nomes. A saída deve ser como no exercício anterior.}