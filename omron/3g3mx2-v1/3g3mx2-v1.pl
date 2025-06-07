is_vfd_param(P_name):-
    re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",P_name).

:- consult(group_a).
:- consult(group_b).
:- consult(group_c).
:- consult(group_d).
:- consult(group_f).
:- consult(group_h).
:- consult(group_p).
:- consult(group_u).
