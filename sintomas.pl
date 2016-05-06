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

probabilidade(zika,50).
probabilidade(chikungunya,30).
probabilidade(dengue,100).

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
    optionFebre(X),
    X==0,!.

optionFebre(0):- !.
optionFebre(1):- write('lala'),nl,!.
optionFebre(2):- cabecaMenu(),!.


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


