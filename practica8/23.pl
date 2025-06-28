desde(X, X).
desde(X, Y):-
    X1 is X + 1,
    desde(X1, Y).

% arbol(-A)
arbol(A):- desde(0, Y), arbolPorNivel(Y, A).

arbolPorNivel(0, nil).
arbolPorNivel(N, bin(AI, _, AD)):-
    N > 0,
    N1 is N - 1,
    between(0, N1, NI),
    ND is N1 - NI,
    arbolPorNivel(NI, AI),
    arbolPorNivel(ND, AD).