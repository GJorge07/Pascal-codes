program buscaemregistros;

type registro = record
                nome:string[100];
                telefone:string[20];
                endereco:string[100];
                idade:longint;
                rg:longint;
                cpf:string[20];
end;
vetor = array[1..1000] of registro;
var r:registro;
    v:vetor;
    tam:longint;
    cpfprocurado:string[20];

procedure lecliente(var r:registro);
begin
    with r do 
    begin
               readln (nome);
               readln (telefone);
               readln (endereco);
               readln (idade);
               readln (rg);
               readln (cpf);
    end;
end;

procedure todosclientes(var v:vetor);
var i:longint;
begin
    for i:=1 to tam do
        lecliente(v[i]);
end;

procedure busca_telefone(var v:vetor;tam:longint;cpfprocurado:string);
var i:longint;
begin
    i:=1;
    while (i<=tam) and (v[i].cpf<>cpfprocurado) do 
        i:=i+1;
    if (i<=tam) then
        writeln('O telefone do cliente com cpf',v[i].cpf, 'é', v[i].telefone )
    else 
        writeln('cliente inexistente');
end;

begin
    read(tam);
    readln;
    todosclientes(v);
    readln(cpfprocurado);
    busca_telefone(v, tam,cpfprocurado);
end.