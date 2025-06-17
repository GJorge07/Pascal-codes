program ex3livro;

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
    ordenanome(v,tam);
    imprimetudo(v,tam);
end.


{Considerando a estrutura definida no exercício anterior, faça um programa em
Pascal que ordene os dados por ordem de nome e imprima, evidentemente por
ordem de nome, todos os dados de todas as pessoas cadastradas, um por linha, dados separados por vírgula, sendo que as datas de nascimento devem ser
impressas no formato padrão brasileiro.}