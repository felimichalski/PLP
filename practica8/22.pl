% esNodo(+G,?X)
% esArista(+G,?X,?Y)

% caminoSimple(+G,+D,+H,?L)
caminoSimple(G, D, H, L):- caminoSimpleAux(G, D, H, [D], L).

caminoSimpleAux(_, H, H, _, [H]).
caminoSimpleAux(G, D, H, Visitados, [D|XS]):-
    D \= H,
    esArista(G, D, X),
    not(member(X, Visitados)),
    caminoSimpleAux(G, X, H, [X|Visitados], XS).

% caminoHamiltoniano(+G,?L)
caminoHamiltoniano(G,L):-
    esNodo(G, N1),
    esNodo(G, N2),
    N1 \= N2,
    caminoSimple(G, N1, N2, L),
    not((
        esNodo(G, N3),
        not(member(N3, L))
    )).

% esConexo(+G)
esConexo(G):-
    not((
        esNodo(G, N1),
        esNodo(G, N2),
        N1 \= N2,
        not(caminoSimple(G, N1, N2, _))
    )).

% esEstrella(+G)
esEstrella(G):-
    esConexo(G),
    esNodo(G, N1),
    not((
        esNodo(G, N2),
        N1 \= N2,
        not(esArista(G, N1, N2))
    )).