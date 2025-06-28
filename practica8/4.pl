%juntar(?Lista1,?Lista2,?Lista3)
juntar([], L, L).
juntar([H|T], L2, [H|T3]) :-
    juntar(T, L2, T3).