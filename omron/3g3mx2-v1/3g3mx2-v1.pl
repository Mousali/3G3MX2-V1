:- use_module(library(clpfd)).
:- use_module(library(isub)).
:- use_module(library(macros)).

#define(fuzzy_match_key_value(K,V), (isub(K, V, D, [normalize(true),zero_to_one(true)]), D >= 0.8)).

is_vfd_param(P_name):-
    re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",P_name).

vdf_class('400V').

:- multifile value_function_text/3.

:- consult(group_a).
:- consult(group_b).
:- consult(group_c).
:- consult(group_d).
:- consult(group_f).
:- consult(group_h).
:- consult(group_p).
:- consult(group_u).
