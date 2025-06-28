
subsecuenciaCreciente(L,S):- subsecuencia(L,S), creciente(S).

subsecuencia([],[]).
subsecuencia([X|XS],[X|YS]):- subsecuencia(XS,YS).
subsecuencia([_|XS],YS):- subsecuencia(XS,YS).

creciente([]).
creciente([_]).
creciente([X,Y|XS]):- X < Y, creciente([Y|XS]).

subsecuenciaCrecienteMasLarga(L,S):- subsecuenciaCreciente(L,S), not((subsecuenciaCreciente(L,S2), S \= S2 , length(S,L1), length(S2,L2), L2 > L1)).

fibonacci1(X):-
    fibonacciAux(0, 1, X).

fibonacciAux(_, B, B).
fibonacciAux(A, B, N):-
    S is A + B,
    fibonacciAux(B, S, N).

desde(X, X).
desde(X, Y):-
    X1 is X + 1,
    desde(X1, Y).

fibonacci2(X):- desde(0, N), fibonacciPorIndice(N, X).

fibonacciPorIndice(0, 1).
fibonacciPorIndice(1, 1).
fibonacciPorIndice(N, X):- N > 1, N1 is N - 1, N2 is N - 2, fibonacciPorIndice(N1, X1), fibonacciPorIndice(N2, X2), X is X1 + X2.