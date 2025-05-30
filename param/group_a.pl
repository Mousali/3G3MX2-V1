:- consult(["../utilities.pl"]).

a001(00, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (Volume)",
    S.inverter.accessories = "3G3AX-OP01", !.

a001(01, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Control circuit terminal block (Analog input)", !.

a001(01, calculated):-
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "voltage (FV)", !.

a001(01, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "current (FI)", !.

a001(02, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (F001)", !.

a001(03, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Modbus communication", !.

a001(04, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Option", !.

a001(06, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Pulse train frequency", !.

a001(07, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "DriveProgramming", !.

a001(10, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Operation function output", !.

a001(02, default).

% A201
a201(00, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (Volume)",
    S.inverter.accessories = "3G3AX-OP01", !.

a201(01, calculated):-
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Control circuit terminal block (Analog input)", !.

a201(01, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "voltage (FV)", !.

a201(01, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "current (FI)", !.

a201(02, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (F001)", !.

a201(03, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Modbus communication", !.

a201(04, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Option", !.

a201(06, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Pulse train frequency", !.

a201(07, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "DriveProgramming", !.

a201(10, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Operation function output", !.

a201(02, default).

% A002 1st RUN Command Selection
a002(01, calculated):-
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Control terminal block (Drive-Programming)", !.

a002(02, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Digital Operator", !.

a002(03, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Modbus communication", !.

a002(04, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Option", !.

a002(02, default).

% A202 2st RUN Command Selection
a202(01, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") ="Control terminal block (Drive-Programming)", !.

a202(02, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") = "Digital Operator", !.

a202(03, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") = "Modbus communication", !.

a202(04, calculated):- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") = "Option", !.

a202(02, default).

% A003
a003(F, calculated):- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('1st').get(rpm).get(base),S.motor.get('1st').get(poles)),
    F >= 30,
    a004(F_max, _),
    F =< F_max, !.

a003(60.0, default).

a203(F, calculated):- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('2st').get(rpm).get(base),S.motor.get('2st').get(poles)),
    F >= 30,
    a204(F_max,_),
    F =< F_max, !.

a203(60.0, default).

% motor maximum operating frequency
a004(F, calculated):- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('1st').get(rpm).get(base),S.motor.get('1st').get(poles)),
    F =< 400,
    S.operations.inverter_mode \= "Induction motor high-frequency", !.

a004(60.0, default).

a204(F, calculated):- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('2st').get(rpm).get(base),S.motor.get('2st').get(poles)),
    F =< 400,
    S.operations.inverter_mode \= "Induction motor high-frequency", !.
    
a204(F, calculated):- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('2st').get(rpm).get(base),S.motor.get('2st').get(poles)),
    F =< 580,
    S.operations.inverter_mode = "Induction motor high-frequency", !.

a204(60.0, default).
    
% A005 FV/FI Selection
% Switch between FV (Voltage) and FI (Current)
a005(00, calculated):-
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference) = "voltage (FV)", !.

a005(00, calculated):-
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference) = "current (FI)", !.
    
% Switch between FV (Voltage) and volume
a005(02, calculated):-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_reference) = "voltage (FV)", !.
    
a005(02, calculated):-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_reference) = "Digital Operator (Volume)", !.
    
% 'witch between FI (Current) and volume
a005(03, calculated):-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_reference) = "current (FI)", !.

a005(03, calculated):-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_reference) = "Digital Operator (Volume)", !.

a005(00, default).

a141(02, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference) = "voltage (FV)", !.
    
a141(03, calculated):- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference) = "current (FI)", !.

a141(02, default).

a011(F, calculated):-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s1) , S.motor.get('1st').get(poles) ),
    a003(A003,_),
    F =< A003, !.

a011(0.00, default).

a101(F, calculated):-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s1) , S.motor.get('1st').get(poles) ),
    a003(A003,_),
    F =< A003, !.

a101(0.00, default).

a161(F, calculated):-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s1) , S.motor.get('1st').get(poles) ),
    a003(A003,_),
    F =< A003,
    F < 100, !.

a161(0.00, default).

a012(F, calculated):-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s2) , S.motor.get('1st').get(poles) ),
    a003(A003,_),
    F =< A003, !.

a012(0.00, default).

a102(F, calculated):-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s2) , S.motor.get('1st').get(poles) ),
    a003(A003,_),
    F =< A003, !.

a102(0.00, default).

a162(F, calculated):-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s2) , S.motor.get('1st').get(poles) ),
    a003(A003,_),
    F =< A003, !.

a162(0.00, default).

a013(I0, calculated):-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1, !.

a013(0.0, default).

a103(I0, calculated):-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1, !.

a103(20, default).


a163(I0, calculated):-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1, !.

a163(0.0, default).


a014(I1, calculated):-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1, !.

a014(100, default).

a104(I1, calculated):-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1, !.

a104(100, default).

a164(I1, calculated):-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1, !.

a164(100.0, default).

a015(00, calculated):-
    b_getval(spec, S),
    S.operations.get(s0_at_0) = 0, !.
    
a015(01, calculated):-
    b_getval(spec, S),
    S.operations.get(s0_at_0) > 0,
    S.operations.get(s0_at_0) = S.operations.get(s1), !.
        
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
