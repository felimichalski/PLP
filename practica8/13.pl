desde(X, X).
desde(X, Y):- X1 is X + 1, desde(X1, Y).

% coprimos(-X,-Y)
coprimos(X, Y):- desde(3, X), between(2, X, Y), gcd(X, Y).

gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

gcd(X, Y) :-
    gcd(X, Y, G),
    G =:= 1.