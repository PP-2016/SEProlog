%Modo de leitura sintomas ---     "Febre é sintoma de Zika"

sintoma(febre, zika, dengue, chikungunya).
sintoma(dorCabeca, zika, dengue, chikungunya).
sintoma(dorNoCorpo, zika, dengue, chikungunya).
sintoma(fadiga, zika, dengue, chikungunya).
sintoma(nauseas, dengue, chikungunya).
sintoma(nauseas, dengue, chikungunya).
sintoma(conjuntivite, zika).
sintoma(hipersensibilidadeLuz, chikungunya).
sintoma(feridasNaBoca, chikungunya).

%Modo de leitura febre ---     "No Zika a Febre é baixa"
febre(zika, baixa).
febre(dengue,chikungunya, alta).

%Modo de leitura dorCabeca ---     "No Zika a dor de cabeça é baixa"
dorCabeca(zika,chikungunya, fraca).
dorCabeca(dengue, forte).


%Modo de leitura dorNoCorpo ---     "No Zika a dorno corpo é nas articulacoes"
dorNoCorpo(zika,chikungunya, articulacoes).
dorNoCorpo(dengue, muscular).

:-dynamic probabilidade/2.
probabilidade(zika,0).
probabilidade(chikungunya,0).
probabilidade(dengue,0).


%diagnostico(paciente,zika).
%diagnostico(paciente,chikungunya).
%diagnostico(paciente,dengue).

%Regras

diagnostico(X,zika):- probabilidade(zika,Z), probabilidade(chikungunya,K), probabilidade(dengue,T), Z>K, Z>T.
diagnostico(X,chikungunya):- probabilidade(chikungunya,Z), probabilidade(zika,K), probabilidade(dengue,T), Z>K, Z>T.
diagnostico(X,dengue):- probabilidade(dengue,Z), probabilidade(chikungunya,K), probabilidade(zika,T), Z>K, Z>T.



menu:-
    write('Voce esta com febre?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(X),
    optionFebre(X).

optionFebre(0):- write('Nenhum diagnostico'),!.
optionFebre(1):- optionFebreMenu(),!.
optionFebre(2):- cabecaMenu(),!.


optionFebreMenu:-
    write('A febre eh maior que 39?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(W),
    opcao(W).

opcao(1):- memoriza(Z),!.
%opcao(2):- chamar modificador de probabilidade menor, chamar proxima pergunta.


memoriza(X):-
    probabilidade(dengue,Y),
    Z is Y+10,
    retract(probabilidade(X,_)),
    assert(probabilidade(X,Z)).


cabecaMenu:-
    write('Voce esta com dor de cabeca?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionCabeca(Y),
    Y==0,!.

optionCabeca(0):- !.
optionCabeca(1):- write('lala'),nl,!.


corpoMenu:-
    write('Voce esta com dor no corpo?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionCorpo(Y),
    Y==0,!.

optionCorpo(0):- !.
optionCorpo(1):- write('lala'),nl,!.

nauseaMenu:-
    write('Voce esta com dor de cabeca?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionNause(Y),
    Y==0,!.

optionCabeca(0):- !.
optionCabeca(1):- write('lala'),nl,!.


