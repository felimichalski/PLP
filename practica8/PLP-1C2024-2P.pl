% estudiante(?) generador de estudiantes
% notas(-XS) -> [(Estudiante, Materia, Nota)]

% tieneMateriaAprobada(+E, +M)
tieneMateriaAprobada(E, M):- estudiante(E), notas(XS), member((E, M, N), XS), N >= 4.

% elminarAplazos(+NS, -L)
eliminarAplazos([], []).
eliminarAplazos([(E, M, N)|XS], [(E, M, N)|LS]):-  N >= 4, eliminarAplazos(XS, LS).
eliminarAplazos([(E, M, N)|XS], [(E, M, N)|LS]):-  N < 4, not(tieneMateriaAprobada(E, M)), eliminarAplazos(XS, LS).
eliminarAplazos([(E, M, N)|XS], LS):-  N < 4, tieneMateriaAprobada(E, M), eliminarAplazos(XS, LS).

% promedio(+A, -P)
promedio(A, P):- notas(XS), eliminarAplazos(XS, LS), notasPorAlumno(A, LS, NS), sum_list(NS, Total), length(NS, X), X > 0, P is Total / X.
promedio(A, P):- notas(XS), eliminarAplazos(XS, LS), notasPorAlumno(A, LS, NS), sum_list(NS, Total), length(NS, X), X =:= 0, P is X.

notasPorAlumno(_, [], []).
notasPorAlumno(A, [(A, _, N)|XS], [N|NS]):- notasPorAlumno(A, XS, NS).
notasPorAlumno(A, [(E, _, _)|XS], NS):- A \= E, notasPorAlumno(A, XS, NS).

% mejorEstudiante(-A)
mejorEstudiante(A):- promedio(A, PA), not((promedio(B, PB), PB > PA)). % promedio es reversible en A, no hace falta instanciar estudiante(A)