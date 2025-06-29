desde(X, X).
desde(X, Y):- X1 is X + 1, desde(X1, Y).

esTriangulo(tri(A, B, C)) :-
    A > 0, B > 0, C > 0,
    A + B > C,
    A + C > B,
    B + C > A.

% perimetro(?T,?P)
perimetro(tri(A, B, C), P):-
    var(P), % no instanciado
    number(A), number(B), number(C),
    P is A + B + C,
    esTriangulo(tri(A, B, C)).
perimetro(tri(A, B, C), P):-
    var(P), % no instanciado
    not((number(A), number(B), number(C))),
    desde(0, P),
    between(0, P, A),
    between(0, P, B),
    between(0, P, C),
    A + B + C =:= P,
    esTriangulo(tri(A, B, C)).
perimetro(tri(A, B, C), P):-
    nonvar(P), % instanciado
    between(0, P, A),
    between(0, P, B),
    between(0, P, C),
    A + B + C =:= P,
    esTriangulo(tri(A, B, C)).

% triangulo(-T)
triangulo(T):-
    desde(0, N),
    perimetro(T, N).