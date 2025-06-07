% Group f: Basic function Parameters

% 0 Starting rpm -> 1st/2nd Maximum rpm (Hz)

f001(F, "starting frequency"):-
   b_getval(spec, S),
   F #= S.get(operation/start_rpm) * S.get(motor/'1st'/poles) // 120,
   a004(F_max, _),
   F #=< F_max,
   !.

f001(F_max, "Maximum VFD starting frequency"):-
   b_getval(spec, S),
   F #= S.get(operation/start_rpm) * S.get(motor/'1st'/poles) // 120,
   a004(F_max, _),
   F #> F_max,
   !.

% TODO: When the PID function is enabled: 0.0 -> 100.0 (per sent)


f001(6.00, default).

f002(A, "acceleration in seconds"):-
    b_getval(spec, S),
    A = S.get(operation/motor/'1st'/acceleration),
    !.

f002(10.00, default):-
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.

f002(30.00, default):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").


f202(A, "acceleration in seconds"):-
    b_getval(spec, S),
    A = S.get(operation/motor/'2nd'/acceleration),
    !.

f202(10.00, default):-
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.

f202(30.00, default):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

f003(A, "deceleration in seconds"):-
    b_getval(spec, S),
    A = S.get(operation/motor/'1st'/deceleration),
    !.

f003(10.00, default):-
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.

f003(30.00, default):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

f203(A, "deceleration in seconds"):-
    b_getval(spec, S),
    A = S.get(operation/motor/'2nd'/deceleration),
    !.

f203(10.00, default):-
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.

f203(30.00, default):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").


f004(00, "forward"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operation/direction),"forward"),
    !.

f004(01, "reverse"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operation/direction),"reverse"),
    !.

f004(00, default).
