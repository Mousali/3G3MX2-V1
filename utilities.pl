:- use_module(library(clpfd)).

freq_speed(F,S,Poles) :-
    F * 120 // Poles #= S.