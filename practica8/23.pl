desde(X, X).
desde(X, Y):- X1 is X + 1, desde(X1, Y).

% arbol(-A)
arbol(A):- desde(0, N), arbolDeAltura(N, A).

%arbolDeAltura(+A, -T)
arbolDeAltura(0, nil).
arbolDeAltura(N, bin(I, _, D)):-
    N > 0,
    N1 is N - 1,
    between(0, N1, N2),
    between(0, N1, N3),
    not((
        N2 < N1,
        N3 < N1
    )),
    arbolDeAltura(N2, I),
    arbolDeAltura(N3, D).

% nodosEn(?A, +L)
nodosEn(nil, _).
nodosEn(bin(I, R, D), L):- member(R, L), nodosEn(I, L), nodosEn(D, L).

% sinRepEn(-A, +L)
sinRepEn(nil, _).
sinRepEn(bin(I, R, D), XS):-
    member(R, XS),
    select(R, XS, YS),
    sinRepEn(I, YS),
    sinRepEn(D, YS),
    listaDeNodos(I, NI),
    listaDeNodos(D, ND),
    not((member(N, NI), member(N, ND))).

listaDeNodos(nil, []).
listaDeNodos(bin(I, R, D), [R|NS]):- listaDeNodos(I, NI), listaDeNodos(D, NR), append(NI, NR, NS).