:- dynamic a001/1.

f001(F, computed):-
   b_getval(spec, S),
   a001(02),
   F=S.operations.initial_frequency ,!.

% Default values 
% Group f: Basic function Parameters
f001(6.00, default).
f002(10.00, default).
f202(10.00, default).
f003(10.00, default).
f203(10.00, default).
f004(00, default).
