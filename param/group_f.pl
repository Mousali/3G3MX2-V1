:- dynamic a001/1.

f001(F):-
   b_getval(spec, S),
   a001("02"),
   F=S.operations.initial_frequency . 