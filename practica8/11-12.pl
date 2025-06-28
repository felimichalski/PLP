nil.
bin(_, _, _).

vacio(nil).

raiz(nil, nil).
raiz(bin(_, V, _), V).

altura(nil, 0).
altura(bin(I, _, D), X):- not(vacio(I)), altura(I, X1), altura(D, X2), X1 > X2, X is X1 + 1.
altura(bin(I, _, D), X):- vacio(I), altura(I, X1), altura(D, X2), X1 > X2, X is X1.
altura(bin(I, _, D), X):- not(vacio(D)), altura(I, X1), altura(D, X2), X1 =< X2, X is X2 + 1.
altura(bin(I, _, D), X):- vacio(D), altura(I, X1), altura(D, X2), X1 =< X2, X is X2.

cantidadDeNodos(nil, 0).
cantidadDeNodos(bin(I, _, D), X):- cantidadDeNodos(I, X1), cantidadDeNodos(D, X2), X3 is X1 + X2, X is X3 + 1.

% inorder(+AB,-Lista)
inorder(nil, []).
inorder(bin(I, V, D), L):- inorder(I, L1), inorder(D, L2), append(L1, [V], L3), append(L3, L2, L).

% arbolConInorder(+Lista,-AB)
arbolConInorder([], nil).
arbolConInorder(L, bin(I, V, D)) :-
    length(L, N),
    N > 0,
    N1 is N - 1,
    between(0, N1, K),
    length(L1, K),
    append(L1, [V|L2], L),
    arbolConInorder(L1, I),
    arbolConInorder(L2, D).

% aBB(+T)
aBB(nil).
aBB(bin(I, V, D)):- mayor(D, V), menor(I, V), aBB(I), aBB(D).

mayor(nil, _).
mayor(bin(I, V, D), M):-
    V >= M,
    mayor(I, M),
    mayor(D, M).

menor(nil, _).
menor(bin(I, V, D), M):-
    V =< M,
    menor(I, M),
    menor(D, M).

% aBBInsertar(+X, +T1, -T2)
aBBInsertar(X, nil, bin(nil, X, nil)).
aBBInsertar(X, bin(nil, V, D), bin(X, V, D)):- X < V.
aBBInsertar(X, bin(I, V, nil), bin(I, V, X)):- X > V.
aBBInsertar(X, bin(I, V, D), bin(I2, V, D)):- not(vacio(I)), X < V, aBBInsertar(X, I, I2).
aBBInsertar(X, bin(I, V, D), bin(I, V, D2)):- not(vacio(D)), X > V, aBBInsertar(X, D, D2).