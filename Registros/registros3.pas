program vetoresderegistros;

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

procedure imprimecliente(var r:registro);
begin
    with r do
    begin
        writeln(nome);
        writeln(telefone);
        writeln(endereco);
        writeln(idade);
        writeln(rg);
        writeln(cpf);
    end;
end;

procedure imprimevetor(var v:vetor; tam: longint);
var i: longint;
begin
    for i := 1 to tam do
        imprimecliente(v[i]);
end;

begin
    read(tam);
    readln;
    todosclientes(v);
    imprimevetor(v, tam);
end.
