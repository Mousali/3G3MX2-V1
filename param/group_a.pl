:- use_module(library(clpfd)).
:- use_module(library(isub)).
:- use_module(library(macros)).

#define(fuzzy_match_key_value(K,V), (isub(K, V, D, [normalize(true),zero_to_one(true)]), D >= 0.8)).

a001(00, "Digital Operator (Volume) with 3G3AX-OP01"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (Volume)"),
	#fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX-OP01"),
	!.

a001(01, "Control circuit terminal block (Analog input)"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Control circuit terminal block (Analog input)"),
	!.

a001(01, "voltage (FV)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference), "voltage (FV)"),
	!.

a001(01, "current (FI)"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference), "current (FI)"),
	!.

a001(02, "Digital Operator (F001)"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (F001)"),
	!.

a001(03, "Modbus communication"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Modbus communication"),
	!.

a001(04, "Option"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Option"),
	!.

a001(06, "Pulse train frequency"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Pulse train frequency"),
	!.

a001(07, "DriveProgramming"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"DriveProgramming"),
	!.

a001(10, "Operation function output"):- 
    b_getval(spec, S),
	#fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Operation function output"),
	!.

a001(02, default).

% A201
a201(00, "Digital Operator (Volume) with 3G3AX-OP01"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Digital Operator (Volume)"),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX-OP01"), !.

a201(01, "Control circuit terminal block (Analog input)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Control circuit terminal block (Analog input)"), !.

a201(01, "voltage (FV)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"voltage (FV)"), !.

a201(01, "current (FI)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"current (FI)"), !.

a201(02, "Digital Operator (F001)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Digital Operator (F001)"), !.

a201(03, "Digital Operator (F001)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Modbus communication"), !.

a201(04, "Option"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Option"), !.

a201(06, "Pulse train frequency"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Pulse train frequency"), !.

a201(07, "DriveProgramming"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"DriveProgramming"), !.

a201(10, "Operation function output"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2nd'/speed_reference),"Operation function output"), !.

a201(02, default).

% A002 1st RUN Command Selection
a002(01, "Control terminal block (Drive-Programming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Control terminal block (Drive-Programming)"), !.

a002(02, "Digital Operator"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Digital Operator"), !.

a002(03, "Modbus communication"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Modbus communication"), !.

a002(04, "Option"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/'run_command_source'),"Option"), !.

a002(02, default).

% A202 2st RUN Command Selection
a202(01, "Control terminal block (Drive-Programming)"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Control terminal block (Drive-Programming)"), !.

a202(02, "Digital Operator"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Digital Operator"), !.

a202(03, "Modbus communication"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Modbus communication"), !.

a202(04, "Option"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'2st'/'run_command_source'),"Option"), !.

a202(02, default).

% A003
a003(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F >= 30,
    a004(F_max, _),
    F =< F_max, 
    !.

a003(60.0, default).

a203(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F >= 30,
    a204(F_max,_),
    F =< F_max, 
    !.

a203(60.0, default).

% motor maximum operating frequency
a004(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 400,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"), !.

a004(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120 (high-frequency mode)', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 580,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"), !.

a004(60.0, default).

a204(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 400,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"), !.
    
a204(F, Msg):- 
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    format(atom(Msg), '(~D Hz * ~D poles) / 120 (high-frequency mode)', [S.get(motor/'1st'/rpm/base), S.get(motor/'1st'/poles)]),
    F =< 580,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"), !.

a204(60.0, default).
    
% A005 FV/FI Selection
% Switch between FV (Voltage) and FI (Current)
a005(00, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"voltage (FV)"), !.

a005(00, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"current (FI)"), !.
    
% Switch between FV (Voltage) and volume
a005(02, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"voltage (FV)"), !.
    
a005(02, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (Volume)"), !.
    
% 'witch between FI (Current) and volume
a005(03, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"current (FI)"), !.

a005(03, calculated):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter/accessories),"3G3AX_OP01"),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"Digital Operator (Volume)"), !.

a005(00, default).

a141(02, calculated):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"voltage (FV)"), !.
    
a141(03, calculated):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(motor/'1st'/speed_reference),"current (FI)"), !.

a141(02, default).

a011(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003, !.

a011(0.00, default).

a101(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003, !.

a101(0.00, default).

a161(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003,
    F < 100, !.

a161(0.00, default).

a012(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003, !.

a012(0.00, default).

a102(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003, !.

a102(0.00, default).

a162(F, calculated):-
    b_getval(spec, S),
    F #= S.get(motor/'1st'/rpm/base) * S.get(motor/'1st'/poles) // 120,
    a003(A003,_),
    F =< A003, !.

a162(0.00, default).

a013(I0, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1, !.

a013(0.0, default).

a103(I0, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1, !.

a103(20, default).


a163(I0, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1, !.

a163(0.0, default).


a014(I1, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1, !.

a014(100, default).

a104(I1, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1, !.

a104(100, default).

a164(I1, calculated):-
    b_getval(spec, S),
    I0 is S.get(operations/i0),
    I1 is S.get(operations/i1),
    I0 < I1, !.

a164(100.0, default).

a015(00, calculated):-
    b_getval(spec, S),
    S.get(operations/s0_at_0) = 0, !.
    
a015(01, calculated):-
    b_getval(spec, S),
    S.get(operations/s0_at_0) > 0,
    S.get(operations/s0_at_0) = S.get(operations/s1), !.
        
a015(01, default).
   
% a016('31', calculated):-
%     % TODO: must not be using PID function
%     analog_input_filter_ms('Fixed to 500-ms filter with ±0.1-Hz hysteresis');
%     (
%         analog_input_filter_ms(Y), 
%         Y >= 62
%     ), !.

% %volume_control_3G3AX_OP01(false), !.

% a016(X, calculated):-
%     analog_input_filter_ms(Y),
%     Y =< 61,
%     X is div(Y,2), !.

a016(8.0, default).

%a017(00, calculated):-
    % DriveProgramming Function Parameters are not covered. 
    % 01: Enabled (Start/stop via multifunction
    % input PRG terminal)
    % 02: Enabled (Start/stop via power
    % on/off)

a017(00, default).

% Multi-step speed, jogging
%a019(00, calculated):-
%    'Binary (16-step selection with 4 terminals)'
%a019(00, calculated):-
%    'Bit (8-step selection with 7 terminals)'

a019(00, default).
a020(6.00, default).
a220(6.00, default).
a021(0.00, default).
a022(0.00, default).
a023(0.00, default).
a024(0.00, default).
a025(0.00, default).
a026(0.00, default).
a027(0.00, default).
a028(0.00, default).
a029(0.00, default).
a030(0.00, default).
a031(0.00, default).
a032(0.00, default).
a033(0.00, default).
a034(0.00, default).
a035(0.00, default).
a038(6.00, default).
a039(04, default).

a041(01, default).
a241(01, default).
a042(1.0, default).
a242(1.0, default).
a043(5.0, default).
a243(5.0, default).
a044(00, default).
a244(00, default).
a045(100.0, default).
a245(100.0, default).
a046(100.0, default).
a246(100.0, default).
a047(0.0, default).
a247(0.0, default).

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
a261(0.00, default).
a062(0.00, default).
a262(0.00, default).
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
a281(02, default).
a082(200, default).
a282(20, default).
a083(0.300, default).
a084(100.0, default).

a085(00, default).
a086(50.0, default).
a092(10.0, default).
a292(10.0, default).
a093(10.0, default).
a293(10.0, default).
a094(00, default).
a294(00, default).
a095(0.00, default).
a295(0.00, default).
a096(0.00, default).
a296(0.00, default).
a097(01, default).
a098(01, default).

a105(00, default).

a131(02, default).
a132(02, default).


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

a165(01, default).
