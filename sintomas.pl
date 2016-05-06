# Modo de leitura sintomas ---     "Febre é sintoma de Zika"

sintoma(febre, zika).
sintoma(dorCabeca, zika).
sintoma(conjuntivite, zika).
sintoma(fadiga, zika).
sintoma(dorNoCorpo, zika).


sintoma(febre, dengue).
sintoma(dorCabeca, dengue).
sintoma(fadiga, dengue).
sintoma(nauseas, dengue).
sintoma(dorNoCorpo, dengue).


sintoma(febre, chikungunya).
sintoma(dorCabeca, chikungunya).
sintoma(fadiga, chikungunya).
sintoma(nauseas, chikungunya).
sintoma(dorNoCorpo, chikungunya).
sintoma(hipersensibilidadeLuz, chikungunya).
sintoma(feridasNaBoca, chikungunya).

%Modo de leitura febre ---     "No Zika a Febre é baixa"
febre(zika, baixa).
febre(dengue, alta).
febre(chikungunya,alta).

%Modo de leitura dorCabeca ---     "No Zika a dor de cabeça é baixa"
dorCabeca(zika, fraca).
dorCabeca(dengue, forte).
dorCabeca(chikungunya, fraca).

%Modo de leitura dorNoCorpo ---     "No Zika a dorno corpo é nas articulacoes"
dorNoCorpo(zika, articulacoes).
dorNoCorpo(dengue, muscular).
dorNoCorpo(chikungunya, articulacoes).

menu:-
    write('menu'), nl,
    write('1 Dengue'), nl,
    read(X),
    option(X),
    X==0,!.

option(0):- !.
option(1):- write('lala'),nl,!.
option(2):- !.