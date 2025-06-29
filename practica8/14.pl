desde(X, X).
desde(X, Y):- X1 is X + 1, desde(X1, Y).

cuadradoSemiMágico(N, XS) :-
    length(XS, N),
    desde(0, Suma),
    matrizDeFilasQueSuman(N, Suma, XS).

matrizDeFilasQueSuman(_, _, []).
matrizDeFilasQueSuman(N, Suma, [Fila|Resto]) :-
    listaQueSuma(Suma, N, Fila),
    matrizDeFilasQueSuman(N, Suma, Resto).

% listaQueSuma(+N, +Long, -XS)
listaQueSuma(0, 0, []).
listaQueSuma(Suma, Long, [X|XS]) :-
    Long > 0,
    between(0, Suma, X),
    S1 is Suma - X,
    L1 is Long - 1,
    listaQueSuma(S1, L1, XS).

% cuadradoMagico(+N, -XS)
cuadradoMagico(N, XS):- cuadradoSemiMágico(N, XS), sumaColumna(0, XS, S), not((between(1, N, NColumna), sumaColumna(NColumna, XS, S2), S \= S2)).

% sumaColumna(+NCol, +Matriz, -Suma)
sumaColumna(N, M, S):- columna(N, M, C), sum_list(C, S).

% columna(+N, +M, -C)
columna(_, [], []).
columna(N, [X|XS], [Y|YS]):- elementoPorIndice(N, X, Y), columna(N, XS, YS).

elementoPorIndice(0, [X|_], X).
elementoPorIndice(I, [_|XS], E):- I > 0, I1 is I - 1, elementoPorIndice(I1, XS, E).