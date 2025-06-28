% last(?L, ?U), donde U es el último elemento de la lista L.
last(L, U) :- append(_, [U], L).

% reverse(+L, ?R), donde R contiene los mismos elementos que L, pero en orden inverso.
reverse([], []).
reverse([X|XS], R) :- reverse(XS, RS), append(RS, [X], R).

% prefijo(?P, +L), donde P es prefijo de la lista L.
prefijo(P, L) :- append(P, _, L).

% sufijo(?S, +L), donde S es sufijo de la lista L.
sufijo(P, L) :- append(_, P, L).

% sublista(?S, +L), donde S es sublista de L.
sublista([], _).
sublista(S, L) :-
    sufijo(Sufijo, L),
    prefijo(S, Sufijo),
    S \= [].

% pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L.
pertenece(X, L) :- sublista([X], L).