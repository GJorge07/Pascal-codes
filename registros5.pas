program ordenaemregistro;

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

procedure troca(var v:vetor;k,m:longint); {k,m = i,menor}
var aux:registro;
begin
    aux:= v[k];
    v[k]:= v[m];
    v[m]:= aux;
end;

procedure ordenacpf(var v:vetor;tam:longint);
var i,j,menor:longint;
begin
    for i:=1 to tam-1 do
    begin
        menor:=i;
        for j:=i+1 to tam do 
            if v[j].cpf > v[menor].cpf then
                menor:=j;
        troca(v,i,menor);
    end;
end;

procedure imprimeclientes(var v:vetor; tam: longint);
var i: longint;
begin
    for i := 1 to tam do
    begin
        writeln(v[i].nome);
        writeln(v[i].telefone);
        writeln(v[i].endereco);
        writeln(v[i].idade);
        writeln(v[i].rg);
        writeln(v[i].cpf);
    end;
end;

begin
    read(tam);
    readln;
    todosclientes(v);
    ordenacpf(v,tam);
    imprimeclientes(v, tam); 
end.