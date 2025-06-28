% intersección(+L1, +L2, -L3)
interseccion([], _, []).
interseccion([X|XS], L, YS):- not(member(X, L)), interseccion(XS, L, YS).
interseccion([X|XS], L, [X|YS]):- list_to_set(L, S), member(X, S), delete(XS, X, ZS), interseccion(ZS, S, YS).
% El list_to_set es necesario porque en caso de que X aparezca n > 1 veces en L,
% entonces member genera n caminos posibles que dan la misma solucion.

partir(N, L, L1, L2):- length(L1, N), append(L1, L2, L).

% borrar(+ListaOriginal, +X, -ListaSinXs),
borrar([], _, []).
borrar([X|XS], X, YS):- borrar(XS, X, YS).
borrar([Y|XS], X, [Y|YS]) :- X \= Y, borrar(XS, X, YS).

% sacarDuplicados(+L1, -L2)
sacarDuplicados([], []).
sacarDuplicados([X|XS], YS):- member(X, XS), sacarDuplicados(XS, YS).
sacarDuplicados([X|XS], [X|YS]):- not(member(X, XS)), sacarDuplicados(XS, YS).

% alternativa para no repetir soluciones por el member
sacarDuplicados2(L, R):- sacarDuplicadosAux(L, [], R).

% sacarDuplicadosAux(Original, Visitados, Resultado)
sacarDuplicadosAux([], _, []).
sacarDuplicadosAux([X|XS], Vistos, R) :-
    member(X, Vistos),
    sacarDuplicadosAux(XS, Vistos, R).
sacarDuplicadosAux([X|XS], Vistos, [X|R]) :-
    \+ member(X, Vistos),
    sacarDuplicadosAux(XS, [X|Vistos], R).

% permutación(+L1, ?L2)
permutación([], []).
permutación([X|XS], YS) :- member(X, YS), select(X, YS, ZS), permutación(XS, ZS).

% reparto(+L, +N, -LListas)
reparto(L, N, LL):- length(LL, N), append(LL, L).

% repartoSinVacías(+L, -LListas)
repartoSinVacías(L, LL):- length(L, N), between(1, N, X), length(LL, X), append(LL, L), not((member(M, LL), M == [])).