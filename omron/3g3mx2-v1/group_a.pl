value_function_text([], Function, Text) :-
    Text = "3G3AX-OP01",
    #fuzzy_match_key_value(Function, Text).
value_function_text(00, Function, Text) :-
    Text = "Digital Operator (Volume)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(01, Function, Text) :-
    Text = "Control circuit terminal block (Analog input)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(02, Function, Text) :-
    Text = "Digital Operator (F001)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(03, Function, Text) :-
    Text = "Modbus communication",
    #fuzzy_match_key_value(Function, Text).
value_function_text(04, Function, Text) :-
    Text = "Option",
    #fuzzy_match_key_value(Function, Text).
value_function_text(06, Function, Text) :-
    Text = "Pulse train frequency",
    #fuzzy_match_key_value(Function, Text).
value_function_text(07, Function, Text) :-
    Text = "DriveProgramming",
    #fuzzy_match_key_value(Function, Text).
value_function_text(10, Function, Text) :-
    Text = "Operation function output",
    #fuzzy_match_key_value(Function, Text).
value_function_text(01, Function, Text) :-
    Text = "Control terminal block (Drive-Programming)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(02, Function, Text) :-
    Text = "Digital Operator",
    #fuzzy_match_key_value(Function, Text).
value_function_text(03, Function, Text) :-
    Text = "Modbus communication",
    #fuzzy_match_key_value(Function, Text).
value_function_text(04, Function, Text) :-
    Text = "Option",
    #fuzzy_match_key_value(Function, Text).
value_function_text(00, Function, Text):-
    Text = "Switch between FV (Voltage) and FI (Current)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(02, Function, Text):-
    Text = "Switch between FV (Voltage) and volume",
    #fuzzy_match_key_value(Function, Text).
value_function_text(03, Function, Text):-
    Text = "Switch between FI (Current) and volume",
    #fuzzy_match_key_value(Function, Text).
value_function_text(00, Function, Text):-
    Text = "FV Start Frequency (A011)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(01, Function, Text):-
    Text = "0 Hz",
    #fuzzy_match_key_value(Function, Text).
value_function_text(00, Function, Text):-
    Text = "Disabled",
    #fuzzy_match_key_value(Function, Text).
value_function_text(01, Function, Text):-
    Text = "Enabled (Start/stop via multi-function input PRG terminal)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(02, Function, Text):-
    Text = "Enabled (Start/stop via power on/off)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(00, Function, Text):-
    Text = "Binary (16-step selection with 4 terminals)",
    #fuzzy_match_key_value(Function, Text).
value_function_text(01, Function, Text):-
    Text = "Bit (8-step selection with 7 terminals)",
    #fuzzy_match_key_value(Function, Text).

%%%%%%%%%%%%

a001(V, Text):- 
    b_getval(spec, S),
    value_function_text(V, S.get(motor/'1st'/frequency_reference_selection), Text),
	value_function_text(_,S.get(inverter/accessories), _),
    !.
 
a001(V, Text):- 
    b_getval(spec, S),
    value_function_text(V, S.get(motor/'1st'/frequency_reference_selection), Text),
	\+ value_function_text(_,S.get(inverter/accessories), _),
    !.

a001(02, default).

a201(V, Text):- 
    b_getval(spec, S),
    value_function_text(V, S.get(motor/'2nd'/frequency_reference_selection), Text),
	value_function_text(_,S.get(inverter/accessories), _),
    !.

a201(V, Text):- 
    b_getval(spec, S),
    value_function_text(V, S.get(motor/'2nd'/frequency_reference_selection), Text),
	\+ value_function_text(_,S.get(inverter/accessories), _),
    !.

a201(02, default).

a002(V, Text):- 
    b_getval(spec, S),
    value_function_text(V, S.get(motor/'1st'/run_command_source), Text),
    !.

a002(02, default).

a202(V, Text):- 
    b_getval(spec, S),
    value_function_text(V, S.get(motor/'2nd'/run_command_source), Text),
    !.


a202(02, default).

% A003
a003(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '1st Base Frequency = (~D RPM * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F >= 30,
    a004(F_max, _),
    F =< F_max, 
	!.

a003(60.0, default):- 
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a003(580, default):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a203(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F >= 30,
    a204(F_max,_),
    F =< F_max, 
	!.

a203(60.0, default):- 
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a203(580, default):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

% motor maximum operating frequency
a004(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/max) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(motor/'1st'/rpm/max), S.get(motor/'1st'/poles)]),
    F =< 400,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
	!.

a004(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/max) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120 (high-frequency mode)', [S.get(motor/'1st'/rpm/max), S.get(motor/'1st'/poles)]),
    F =< 580,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
	!.

a004(60.0, default):- 
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a004(580, default):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a204(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 400,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
	!.
    
a204(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120 (high-frequency mode)', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 580,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
	!.

a204(60.0, default):- 
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a204(580, default):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency").

a005(V, Text):-
    b_getval(spec, S),
    value_fuzzy_match_key_value(V, S.get(inputs/analog/fv_fi_selection),Text),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
	!.

a005(V, Text):-
    b_getval(spec, S),
    value_fuzzy_match_key_value(V, S.get(inputs/analog/fv_fi_selection),Text),
    \+ #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    !.
    
a005(00, default).


a011(F, Msg):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/fv_start_rpm) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/analog/fv_start_rpm), S.get(motor/'1st'/poles)]),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    F =< 400,
	!.

a011(F, Msg):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/fv_start_rpm) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120 (high-frequency mode)', [S.get(inputs/analog/fv_start_rpm), S.get(motor/'1st'/poles)]),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    F =< 580,
    !.

a011(0.00, default).

a012(F, Msg):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/fv_end_rpm) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/analog/fv_end_rpm), S.get(motor/'1st'/poles)]),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    F =< 400,
    !.

a012(F, Msg):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/fv_end_rpm) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120 (high-frequency mode)', [S.get(inputs/analog/fv_end_rpm), S.get(motor/'1st'/poles)]),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    F =< 580,
    !.

a012(0.00, default).

a013(R, "FV Start Ratio"):-
    b_getval(spec, S),
    R = S.get(inputs/analog/fv_start_ration),
    R >= S.get(inputs/analog/fv_end_ration),
	!.

a013(0, default).

a014(R, "FV End Ratio"):-
    b_getval(spec, S),
    R = S.get(inputs/analog/fv_end_ration),
    R =< 100,
    !.

a014(100, default).

a015(V, Text):-
    b_getval(spec, S),
    value_fuzzy_match_key_value(V, S.get(inputs/analog/fv_start_selection), Text),
	!.

a015(01, default).

a016(1, "2 ms"):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/analog_input_filter_ms) // 2,
    F < 1,
    !.

a016(F, Msg):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/analog_input_filter_ms) // 2,
    format(atom(Msg), '~D / 2 ms', S.get(inputs/analog/analog_input_filter_ms)),
    F >= 1,
    F =< 30,
    !.

a016(31, "500 ms with ±0.1 Hz hysteresis"):-
    b_getval(spec, S),
    F #= S.get(inputs/analog/analog_input_filter_ms) // 2,
    F > 30,
    !.

a016(8, default).

a017(V, Text):-
    b_getval(spec, S),
    value_fuzzy_match_key_value(V, S.get(inputs/driveProgramming/drive_programming_function_selection), Text),
    !.

a017(00, default).

a019(V, Text):-
    b_getval(spec, S),
    value_fuzzy_match_key_value(V, S.get(inputs/multi_step_speed_jogging/multi_step_speed_selection), Text),
    !.
a019(00, default).

a020(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/'1st_speed_reference_0') * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/'1st_speed_reference_0'), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a020(6.00, default).

a220(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/'2nd_speed_reference_0') * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/'2nd_speed_reference_0'), S.get(motor/'1st'/poles)]),
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a220(6.00, default).

a021(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_1) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_1), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a021(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_1) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_1), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.    
a021(0.00, default).

a022(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_2) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_2), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a022(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_2) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_2), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a022(0.00, default).
a023(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_3) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_3), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a023(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_3) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_3), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a023(0.00, default).
a024(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_4) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_4), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a024(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_4) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_4), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a024(0.00, default).
a025(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_5) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_5), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a025(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_5) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_5), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a025(0.00, default).
a026(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_6) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_6), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a026(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_6) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_6), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a026(0.00, default).
a027(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_7) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_7), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a027(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_7) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_7), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a027(0.00, default).
a028(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_8) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_8), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a028(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_8) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_8), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a028(0.00, default).
a029(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_9) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_9), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a029(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_9) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_9), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a029(0.00, default).
a030(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_10) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_10), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a030(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_10) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_10), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a030(0.00, default).
a031(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_11) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_11), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a031(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_11) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_11), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a031(0.00, default).
a032(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_12) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_12), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a032(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_12) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_12), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a032(0.00, default).
a033(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_13) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_13), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a033(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_13) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_13), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a033(0.00, default).
a034(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_14) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_14), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a034(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_14 ) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_14), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a034(0.00, default).
a035(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_15) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_15), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a004(RPM_max, _),
    RPM =< RPM_max,
    !.
a035(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/speed_reference_15) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/speed_reference_15), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    a204(RPM_max, _),
    RPM =< RPM_max,
    !.
a035(0.00, default).

a038(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/jogging_frequency) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/jogging_frequency), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    RPM =< 9.99,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.
a038(RPM, Msg):-
    b_getval(spec, S),
    RPM #= S.get(inputs/multi_step_speed_jogging/jogging_frequency) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D RPM * ~D poles) / 120', [S.get(inputs/multi_step_speed_jogging/jogging_frequency), S.get(motor/'1st'/poles)]),
    b082(RPM_min, _),
    RPM >= RPM_min,
    RPM =< 100,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.
a038(6.00, default).

a041(01, default).
a241(01, default).
a042(1.0, default).
a043(5.0, default).
a044(00, default).
a045(100.0, default).
a046(100.0, default).
a047(0.0, default).
a051(00, default).
a052(0.50, default).
a053(0.0, default).
a054(50.0, default).
a055(0.5, default).
a056(01, default).
a057(0.0, default).
a058(0.0, default).
a059(5.0, default).
a061(0.00, default).
a062(0.00, default).
a063(0.00, default).
a064(0.50, default).
a065(0.00, default).
a066(0.50, default).
a067(0.00, default).
a068(0.50, default).
a069(0.00, default).
a070(0.0, default).
a071(00, default).
a072(1.00, default).
a073(1.0, default).
a074(0.00, default).
a075(1.00, default).
a076(00, default).
a077(00, default).
a078(0.0, default).
a079(00, default).
a081(02, default).
a082(200, default).
a083(0.300, default).
a084(100.0, default).
a085(00, default).
a086(50.0, default).
a092(10.0, default).
a093(10.0, default).
a094(00, default).
a095(0.00, default).
a096(0.00, default).
a097(01, default).
a098(01, default).
a101(0.00, default).
a102(0.00, default).
a103(20, default).
a104(100, default).
a105(00, default).
a131(02, default).
a132(02, default).
a141(02, default).
a142(03, default).
a143(00, default).
a145(0.00, default).
a146(00, default).
a150(10.0, default).
a151(10.0, default).
a152(10.0, default).
a153(10.0, default).
a154(0.00, default).
a155(0.0, default).
a156(0.00, default).
a157(0.0, default).
a161(0.00, default).
a162(0.00, default).
a163(0.0, default).
a164(100.0, default).
a165(01, default).
a242(1.0, default).
a243(5.0, default).
a244(00, default).
a245(100.0, default).
a246(100.0, default).
a247(0.0, default).
a261(0.00, default).
a262(0.00, default).
a281(02, default).
a282(20, default).
a292(10.0, default).
a293(10.0, default).
a294(00, default).
a295(0.00, default).
a296(0.00, default).