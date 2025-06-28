% aplanar(+Xs, -Ys)
aplanar([], []).
aplanar([X|XS], [X|YS]):- not(is_list(X)), aplanar(XS, YS).
aplanar([X|XS], YS):- is_list(X), aplanar(X, X2), append(X2, XS, ZS), aplanar(ZS, YS).