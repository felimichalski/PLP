padre(juan, carlos).
padre(juan, luis).
padre(carlos, daniel).
padre(carlos, diego).
padre(luis, pablo).
padre(luis, manuel).
padre(luis, ramiro).

abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

hijo(X, Y) :- padre(Y, X).

hermano(X, Y) :- X \= Y, padre(Z, X), padre(Z, Y).