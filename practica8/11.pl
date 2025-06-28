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