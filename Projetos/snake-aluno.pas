(*---------------------------------------------------------------- *)
(* Implementacao do jogo SNAKE *)
(*---------------------------------------------------------------- *)
program snake;
USES CRT;

const
   MAX	    = 80;
   ESPERA   = 100;

   CIMA	     = #72; (* ^ *)
   ESQ	     = #75; (* < *)
   DIR	     = #77; (* > *)
   BAIXO     = #80; (* v *)
   ESC	     = #27; (* ESC *)
   ENTER     = #13; (* ENTER *)  
   FIM       = 'f';
   ZERO	     = #0;

   VERDE    = 10;
   VERMELHO = 12;
   AMARELO  = 14;
   BRANCO   = 15;

   VAZIO = 0;
   CABECA = 1;
   CORPO = 2;
   COMIDA = 3;
type
   TpMatriz  = array[0..MAX+1, 0..MAX+1] of integer;  (* matriz do jogo *)
   TpPonto   = record
		  lin, col : integer;
	       end;	   
   TpPosicao = array[1..MAX*MAX] of TpPonto;          (* posicoes da cobra *)
   TpJogo    = record
		  m		 : TpMatriz;  (* contem valores 0-3: VAZIO..COMIDA *)
		  numLin, numCol : integer;   (* dimensao do jogo *)
		  qtdComida	 : integer;   (* quantidade de comidas *)
		  tamCobra	 : integer;   (* tamanho atual da cobra *)
		  cobra		 : TpPosicao; (* cabeca na posicao cobra[1] *)
	       end;
var
   j		       : TpJogo;
   c		       : char;
   vivo		       : boolean;
   caracter	       : array[0..3] of char = (' ', '@', '=', '*');
                         (* caracteres que representam VAZIO, CABECA, CORPO e COMIDA *)
   cor                 : array[0..3] of integer = (BRANCO, VERDE, VERDE, VERMELHO);
                         (* cores para representar VAZIO, CABECA, CORPO e COMIDA *)

(*-----------------------------------------------------------------------
 * Procedimentos para inicializacao do jogo
 *)
procedure limpaMatriz(var j : TpJogo );
var
   l, c	: integer;
begin
   for l:= 1 to j.numLin do
      for c:= 1 to j.numCol do
	 j.m[l,c]:= VAZIO;
end; { limpaMatriz }


procedure criaComida (var j : TpJogo );
var
   l, c, i : integer;
begin
   randomize();
   i:= 0;
   while i < j.qtdComida do
   begin
      l:= random(j.numLin) + 1;
      c:= random(j.numCol) + 1;
      if ((l<>1) or (c<>1)) and (j.m[l,c] = VAZIO) then
      begin
	 j.m[l,c]:= COMIDA;
	 i:= i+1;
      end;
   end;
end; { criaComida }

procedure criaJogo(var j : TpJogo );
begin
   writeln;
   writeln('Operacoes do jogo:');
   writeln;
   writeln('Setas: movimenta a cobra');
   writeln('<esc>  : finaliza o jogo');
   writeln;
   
   writeln('Entre com numero de linhas, colunas e comida (max= ', MAX, '):');
   readln (j.numLin, j.numCol, j.qtdComida);
   limpaMatriz( j );
   criaComida( j );
   j.tamCobra:= 1;
   j.cobra[1].lin:= 1;
   j.cobra[1].col:= 1;
   j.m[1,1]:= CABECA;
end; { criaJogo }


(*-----------------------------------------------------------------------
 Imprime a matriz de cores, usa a biblioteca CRT para limpar a tela e para 
 imprimir o conteudo da matriz de forma colorida.
*)
procedure mostraJogo (var j : TpJogo );
var
   i,k : integer;
begin
   clrscr;
   textcolor( white );
   for i:=0 to j.numCol+1 do
      write('#');
   writeln;
   for i:= 1 to j.numLin do
   begin
      textcolor( white );
      write('#');
      for k:= 1 to j.numCol do
      begin
	 textcolor( cor[j.m[i,k]] );
	 write( caracter[j.m[i,k]] );
      end;
      textcolor( white );
      write('#');
      writeln;
   end;
   textcolor( white );
   for i:=0 to j.numCol+1 do
      write('#');
   writeln;
end; { mostraJogo }

(*---------------------------------------------------------------- *)
(* retorna caracter teclado *)
function leEntrada():char;
var
   ch : char;
begin
   if keypressed then begin
      ch:= readkey;
      if ch = #0 then
	 ch:= readkey;
      leEntrada:= ch;
   end
   else
      leEntrada:= ZERO;
end;

(*---------------------------------------------------------------- *)
(* Procedimentos para movimentar a cobra *)

(* moveCobra:
Entrada: o jogo 
         nova posicao da cabeca da cobra [novaLin, novaCol]
Saida: a matriz do jogo (j.m) atualizada
       o vetor de posicoes da cobra (j.cobra) atualizada com a cabeca em [novaLin,novaCol]
*)
procedure moveCobra(var j : TpJogo; novaLin, novaCol: integer );
var  i,linhaantigacauda,colunaantigacauda:longint;
begin
      linhaantigacauda:= j.cobra[j.tamCobra].lin;
      colunaantigacauda:= j.cobra[j.tamCobra].col;
      
      for i:=j.tamCobra downto 2 do
         j.cobra[i]:= j.cobra[i-1];

      j.cobra[1].lin:=novaLin;
      j.cobra[1].col:=novaCol;

      j.m[linhaantigacauda,colunaantigacauda]:=VAZIO;

      for i:=2 to j.tamCobra do
         j.m[j.cobra[i].lin,j.cobra[i].col]:=CORPO;
         j.m[novaLin,novaCol]:=CABECA;
end;

(* comeMaca
Entrada: jogo
         nova posicao da cabeca [novaLin, novaCol]
Saida:matriz do jogo atualizada (j.m)
      tamanho da cobra atualizada (j.tamCobra)
      posicoes da cobra atualizada (j.cobra) com a cabeca no posicao [novaLin, novaCol]
*)
procedure comeMaca(var j: TpJogo; novaLin, novaCol: integer );
var i:longint;
begin
      j.tamCobra:=j.tamCobra + 1;
      for i:=j.tamCobra downto 1 do 
         j.cobra[i]:=j.cobra[i-1];

      j.cobra[1].lin:=novaLin;
      j.cobra[1].col:=novaCol;

      for i:=2 to j.tamCobra do
         j.m[j.cobra[i].lin,j.cobra[i].col]:= CORPO;
         j.m[novaLin,novaCol]:=CABECA;
end;

(* posicaoOK:
Entrada: jogo
         direcao do movimento (CIMA, BAIXO, ESQ, DIR)
Saida:true se o movimento está dentro da matriz e nao faz parte do corpo da cobra; 
      falso, caso contrario
      nova posicao (novaLin, novaCol)
*)
function posicaoOK(var j: TpJogo;
		   direcao: char;  var novaLin, novaCol	: integer ): boolean;
begin
   novaLin:= j.cobra[1].lin;
   novaCol:= j.cobra[1].col;
   if c = CIMA then
      novaLin:= novaLin - 1
   else if c = BAIXO then
      novaLin:= novaLin + 1
   else if c = ESQ then
      novaCol:= novaCol - 1
   else if c = DIR then
      novaCol:= novaCol + 1;
   if (novaLin >= 1) and (novaLin <= j.numLin) and 
      (novaCol >= 1) and (novaCol <= j.numCol) and
      (j.m[novaLin, novaCol] <> CORPO) then
      posicaoOK:= true
   else
      posicaoOK:= false;
end;

(* move
Entrada: jogo
         direcao do movimento
Saida: true se o movimento está dentro da matriz e a cabeca nao encosta na cobra
       false, caso contrario
       jogo atualizado: matriz (j.m), posicao da cobra (j.cobra), tamanho da cobra (j.tamCobra)
*)
function move( var j: TpJogo; direcao: char ): boolean;
var
   novaLin, novaCol : integer;
begin
   if not posicaoOK( j, direcao, novaLin, novaCol ) then
      move:= false
   else
   begin
      move:= true;
      if j.m[novaLin, novaCol] = VAZIO then
	 moveCobra( j, novaLin, novaCol )
      else if j.m[novaLin, novaCol] = COMIDA then
	 comeMaca( j, novaLin, novaCol );
   end;
end;


(*********  Programa Principal ************)
begin
   criaJogo( j );
   vivo:= true;
   repeat
      mostraJogo( j );
      delay(ESPERA);
      c:= leEntrada();
      if (c=CIMA) or (c=BAIXO) or (c=ESQ) or (c=DIR) then
	 vivo:= move( j, c );
   until (c = ESC) or (not vivo) or (j.tamCobra = j.qtdComida+1);   
   mostraJogo( j );
   if j.tamCobra = j.qtdComida+1 then
      writeln('Parabens!! Voce terminou o jogo com sucesso.')
   else
      writeln('Voce perdeu.  Tente de novo!! ');
end.
