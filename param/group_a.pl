:- use_module(library(clpfd)).
:- use_module(library(isub)).
:- use_module(library(macros)).

#define(fuzzy_match_key_value(K,V), (isub(K, V, D, [normalize(true),zero_to_one(true)]), D >= 0.8)).

a001(00, "Digital Operator (Volume) with 3G3AX-OP01"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (Volume)"),
	#fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX-OP01"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(01, "Control circuit terminal block (Analog input)"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Control circuit terminal block (Analog input)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(01, "voltage (FV)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference), "voltage (FV)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(01, "current (FI)"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference), "current (FI)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(02, "Digital Operator (F001)"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (F001)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(03, "Modbus communication"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Modbus communication"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(04, "Option"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Option"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(06, "Pulse train frequency"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Pulse train frequency"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(07, "DriveProgramming"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"DriveProgramming"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(10, "Operation function output"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Operation function output"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a001(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

% A201
a201(00, "Digital Operator (Volume) with 3G3AX-OP01"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Digital Operator (Volume)"),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX-OP01"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(01, "Control circuit terminal block (Analog input)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Control circuit terminal block (Analog input)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(01, "voltage (FV)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"voltage (FV)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(01, "current (FI)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"current (FI)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(02, "Digital Operator (F001)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Digital Operator (F001)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(03, "Digital Operator (F001)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Modbus communication"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(04, "Option"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Option"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(06, "Pulse train frequency"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Pulse train frequency"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(07, "DriveProgramming"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"DriveProgramming"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(10, "Operation function output"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Operation function output"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a201(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

% A002 1st RUN Command Selection
a002(01, "Control terminal block (Drive-Programming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Control terminal block (Drive-Programming)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a002(02, "Digital Operator"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Digital Operator"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a002(03, "Modbus communication"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Modbus communication"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a002(04, "Option"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Option"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a002(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

% A202 2st RUN Command Selection
a202(01, "Control terminal block (Drive-Programming)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Control terminal block (Drive-Programming)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a202(02, "Digital Operator"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Digital Operator"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a202(03, "Modbus communication"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Modbus communication"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a202(04, "Option"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Option"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a202(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

% A003
a003(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F >= 30,
    a004(F_max, _),
    F =< F_max, 
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a003(60.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a203(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F >= 30,
    a204(F_max,_),
    F =< F_max, 
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a203(60.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

% motor maximum operating frequency
a004(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 400,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a004(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120 (high-frequency mode)', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 580,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a004(60.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a204(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 400,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
    
a204(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120 (high-frequency mode)', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 580,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a204(60.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

    
% A005 FV/FI Selection
% Switch between FV (Voltage) and FI (Current)
a005(00, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"voltage (FV)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a005(00, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"current (FI)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
    
% Switch between FV (Voltage) and volume
a005(02, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"voltage (FV)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
    
a005(02, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (Volume)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
    
% 'witch between FI (Current) and volume
a005(03, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"current (FI)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a005(03, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (Volume)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a005(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a141(02, calculated):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"voltage (FV)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
    
a141(03, calculated):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"current (FI)"),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a141(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a011(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a011(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a101(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a101(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a161(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    F < 100,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a161(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a012(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a012(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a102(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a102(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a162(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a162(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a013(I0, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a013(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a103(I0, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a103(20, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).


a163(I0, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a163(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).


a014(I1, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a014(100, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a104(I1, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a104(100, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a164(I1, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.

a164(100.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a015(00, calculated):-
    b_getval(spec, S),
    S.get(operations/s0_at_0) = 0,
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
    
a015(01, calculated):-
    b_getval(spec, S),
    S.get(operations/s0_at_0) > 0,
    S.get(operations/s0_at_0) = S.get(operations/s1),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	!.
        
a015(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

   
% a016('31', calculated):-
%     % TODO: must not be using PID function
%     analog_input_filter_ms('Fixed to 500-ms filter with ±0.1-Hz hysteresis');
%     (
%         analog_input_filter_ms(Y), 
%         Y >= 62
%     ),
    % re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	% !.

% %volume_control_3G3AX_OP01(false),
    % re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	% !.

% a016(X, calculated):-
%     analog_input_filter_ms(Y),
%     Y =< 61,
%     X is div(Y,2),
    % re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)),
	% !.

a016(8.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

%a017(00, calculated):-
    % DriveProgramming Function Parameters are not covered. 
    % 01: Enabled (Start/stop via multifunction
    % input PRG terminal)
    % 02: Enabled (Start/stop via power
    % on/off)

a017(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

% Multi-step speed, jogging
%a019(00, calculated):-
%    'Binary (16-step selection with 4 terminals)'
%a019(00, calculated):-
%    'Bit (8-step selection with 7 terminals)'

a019(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a020(6.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a220(6.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a021(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a022(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a023(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a024(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a025(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a026(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a027(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a028(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a029(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a030(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a031(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a032(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a033(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a034(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a035(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a038(6.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a039(04, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a041(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a241(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a042(1.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a242(1.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a043(5.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a243(5.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a044(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a244(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a045(100.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a245(100.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a046(100.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a246(100.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a047(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a247(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a051(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a052(0.50, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a053(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a054(50.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a055(0.5, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a056(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a057(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a058(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a059(5.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a061(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a261(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a062(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a262(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a063(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a064(0.50, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a065(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a066(0.50, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a067(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a068(0.50, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a069(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a070(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a071(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a072(1.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a073(1.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a074(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a075(1.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a076(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a077(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a078(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a079(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a081(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a281(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a082(200, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a282(20, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a083(0.300, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a084(100.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a085(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a086(50.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a092(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a292(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a093(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a293(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a094(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a294(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a095(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a295(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a096(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a296(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a097(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a098(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a105(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a131(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a132(02, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a142(03, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a143(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a145(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a146(00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a150(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a151(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a152(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a153(10.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a154(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a155(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a156(0.00, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a157(0.0, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

a165(01, default):-
    b_getval(spec, S),
    re_match("3G3MX2-.*-V1"/i, S.get(inverter/model)).

