%Modo de leitura sintomas ---     "Febre é sintoma de Zika"

sintoma(febreBaixa, zika).
sintoma(febreAlta, dengue).
sintoma(febreAlta, chikungunya).
sintoma(dorCabecaFraca, zika).
sintoma(dorCabecaFraca, chikungunya).
sintoma(dorCabecaForte, dengue).
sintoma(dorNasArticulacoes, zika).
sintoma(dorNasArticulacoes, chikungunya).
sintoma(dorNoCorpo, dengue).
sintoma(fadiga, zika).
sintoma(fadiga, dengue).
sintoma(fadiga, chikungunya).
sintoma(nauseas, dengue).
sintoma(nauseas, chikungunya).
sintoma(conjuntivite, zika).
sintoma(hipersensibilidadeLuz, chikungunya).
sintoma(feridasNaBoca, chikungunya).

:-dynamic probabilidade/2.
probabilidade(zika,0).
probabilidade(chikungunya,0).
probabilidade(dengue,0).

:-dynamic paciente/1.

%Regras

diagnostico(zika):- (paciente(febreBaixa), paciente(dorCabecaFraca), paciente(dorNasArticulacoes),
                    paciente(fadiga), paciente(conjuntivite)), write("Probabilidade de possuir Zika"),nl ;
                    (paciente(conjuntivite), paciente(febreBaixa)), write("Probabilidade de possuir Zika"),nl .


diagnostico(chikungunya):- (paciente(febreAlta), paciente(dorCabecaFraca), paciente(dorNasArticulacoes),
                           paciente(fadiga), paciente(nauseas), paciente(hipersensibilidadeLuz),
                           paciente(feridasNaBoca)), write("Probabilidade de possuir Chikungunya"),nl ;
                           (paciente(hipersensibilidadeLuz), paciente(feridasNaBoca),
                           paciente(febreAlta)), write("Probabilidade de possuir Chikungunya"),nl .

diagnostico(dengue):- (paciente(febreAlta), paciente(dorCabecaForte), paciente(dorNoCorpo),
                      paciente(fadiga), paciente(nauseas)), write("Probabilidade de possuir Dengue"),nl ;
                      (paciente(febreAlta), paciente(dorCabecaForte), paciente(dorNoCorpo)) ,
                      write("Probabilidade de possuir Dengue"),nl .


menu:- febreMenu().

febreMenu:-
    write('Voce esta com febre?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(X),
    optionFebre(X).

optionFebre(1):- optionFebreMenu().
optionFebre(2):- cabecaMenu().

optionFebreMenu:-
    write('A febre eh maior que 39?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(W),
    opcaoFebre(W).

opcaoFebre(1):- memoriza(febreAlta),cabecaMenu(),!.
opcaoFebre(2):- memoriza(febreBaixa),cabecaMenu(),!.

memoriza(X):-
    assert(paciente(X)).

cabecaMenu:-
    write('Voce esta com dor de cabeca?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(W),
    optionCabeca(W).

optionCabeca(1):- optionCabecaMenu().
optionCabeca(2):- corpoMenu().

optionCabecaMenu:-
    write('Como é a dor de cabeca?'), nl,
    write('1 Forte'), nl,
    write('2 Fraca'), nl,
    read(W),
    opcaoCabeca(W).

opcaoCabeca(1):- memoriza(dorCabecaForte),corpoMenu().
opcaoCabeca(2):- memoriza(dorCabecaFraca),corpoMenu().

corpoMenu:-
    write('Voce esta com dor muscular no corpo?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionCorpo(Y).

optionCorpo(1):- memoriza(dorNoCorpo), articulacoesMenu().
optionCorpo(2):- articulacoesMenu().

articulacoesMenu:-
    write('Voce esta com dor nas suas articulacoes?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionArticulacoes(Y).

optionArticulacoes(1):- memoriza(dorNasArticulacoes), nauseaMenu().
optionArticulacoes(2):- nauseaMenu().


nauseaMenu:-
    write('Voce esta com nauseas?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionNause(Y).

optionNause(1):- memoriza(nauseas),fadigaMenu().
optionNause(2):- fadigaMenu().

fadigaMenu:-
    write('Voce esta se sentido fadigado(a)?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionFadiga(Y).

optionFadiga(1):- memoriza(fadiga), conjuntiviteMenu().
optionFadiga(2):- conjuntiviteMenu().

conjuntiviteMenu:-
    write('Voce desenvolveu conjuntivite?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionConjuntivite(Y).

optionConjuntivite(1):- memoriza(conjuntivite), hyperSensibilidadeLuzMenu().
optionConjuntivite(2):- hyperSensibilidadeLuzMenu().

hyperSensibilidadeLuzMenu:-
    write('Voce desenvolveu uma hiper sensibilidade à luz?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionHiperSensibilidadeLuz(Y).

optionHiperSensibilidadeLuz(1):- memoriza(hipersensibilidadeLuz), feridasNaBocaMenu().
optionHiperSensibilidadeLuz(2):- feridasNaBocaMenu().

feridasNaBocaMenu:-
    write('Voce desenvolveu feridas na boca?'), nl,
    write('1 Sim'), nl,
    write('2 Nao'), nl,
    read(Y),
    optionFeridasNaBoca(Y).

optionFeridasNaBoca(1):- memoriza(feridasNaBoca), diagnosticar().
optionFeridasNaBoca(2):- diagnosticar().

diagnosticar:-
    write('Criando diagnostico. . .'), nl,
    diag().

diag :-
    diagnostico(X),
    fail.
