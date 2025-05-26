:- consult("utilities.pl").

a001("00") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (Volume)",
    S.inverter.accessories = "3G3AX-OP01".

a001("01") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Control circuit terminal block (Analog input)".

a001("01") :-
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "voltage (FV)".

a001("01") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "current (FI)".

a001("02") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (F001)".

a001("03") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Modbus communication".

a001("04") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Option".

a001("06") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Pulse train frequency".

a001("07") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "DriveProgramming".

a001("10") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Operation function output".

% A201
a201("00") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (Volume)",
    S.inverter.accessories = "3G3AX-OP01".

a201("01") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Control circuit terminal block (Analog input)".

a201("01") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "voltage (FV)".

a201("01") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "current (FI)".

a201("02") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (F001)".

a201("03") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Modbus communication".

a201("04") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Option".

a201("06") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Pulse train frequency".

a201("07") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "DriveProgramming".

a201("10") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Operation function output".

% A002 1st RUN Command Selection
a002("01") :-
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Control terminal block (Drive-Programming)".

a002("02") :- 
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Digital Operator".

a002("03") :- 
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Modbus communication".

a002("04") :- 
    b_getval(spec, S),
    S.motor.get('1st').get('run_command_source',"Digital Operator") = "Option".

% A202 2st RUN Command Selection
a202("01") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") ="Control terminal block (Drive-Programming)".

a202("02") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") = "Digital Operator".

a202("03") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") = "Modbus communication".

a202("04") :- 
    b_getval(spec, S),
    S.motor.get('2nd').get(run_command_source,"Digital Operator") = "Option".

% A003
a003(F) :- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('1st').get(rpm).get(base),S.motor.get('1st').get(poles)),
    F >= 30,
    a004(F_max),
    F =< F_max.

a203(F) :- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('2st').get(rpm).get(base),S.motor.get('2st').get(poles)),
    F >= 30,
    a204(F_max),
    F =< F_max.

% motor maximum operating frequency
a004(F) :- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('1st').get(rpm).get(base),S.motor.get('1st').get(poles)),
    F =< 400,
    S.operations.inverter_mode \= "Induction motor high-frequency".
    
a204(F) :- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('2st').get(rpm).get(base),S.motor.get('2st').get(poles)),
    F =< 400,
    S.operations.inverter_mode \= "Induction motor high-frequency".
    
a204(F) :- 
    b_getval(spec, S),
    freq_speed(F,S.motor.get('2st').get(rpm).get(base),S.motor.get('2st').get(poles)),
    F =< 580,
    S.operations.inverter_mode = "Induction motor high-frequency".

    
% A005 FV/FI Selection
% Switch between FV (Voltage) and FI (Current)
a005("00") :-
    b_getval(spec, S),
    S.motor.get('1st').get(speed_control_source) = "voltage (FV)".

a005("00") :-
    b_getval(spec, S),
    S.motor.get('1st').get(speed_control_source) = "current (FI)".
    
% Switch between FV (Voltage) and volume
a005("02") :-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_control_source) = "voltage (FV)".
    
a005("02") :-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_control_source) = "Digital Operator (Volume)".
    
% 'witch between FI (Current) and volume
a005("03") :-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_control_source) = "current (FI)".

a005("03") :-
    b_getval(spec, S),
    S.inverter.get(accessories) = "3G3AX_OP01",
    S.motor.get('1st').get(speed_control_source) = "Digital Operator (Volume)".

a141("02") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_control_source) = "voltage (FV)".
    
a141("03") :- 
    b_getval(spec, S),
    S.motor.get('1st').get(speed_control_source) = "current (FI)".

a011(F) :-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s1) , S.motor.get('1st').get(poles) ),
    a003(A003),
    F =< A003.

a101(F) :-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s1) , S.motor.get('1st').get(poles) ),
    a003(A003),
    F =< A003.

a161(F) :-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s1) , S.motor.get('1st').get(poles) ),
    a003(A003),
    F =< A003,
    F < 100.

a012(F) :-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s2) , S.motor.get('1st').get(poles) ),
    a003(A003),
    F =< A003.

a102(F) :-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s2) , S.motor.get('1st').get(poles) ),
    a003(A003),
    F =< A003.

a162(F) :-
    b_getval(spec, S),
    freq_speed( F , S.operations.get(s2) , S.motor.get('1st').get(poles) ),
    a003(A003),
    F =< A003.

a013(I0) :-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1.
    
a103(I0) :-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1.

a163(I0) :-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1.

a014(I1) :-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1.
    
a104(I1) :-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1.

a164(I1) :-
    b_getval(spec, S),
    I0 is S.operations.get(i0),
    I1 is S.operations.get(i1),
    I0 < I1.

a015("00") :-
    b_getval(spec, S),
    S.operations.get(s0_at_0) = 0.
    
a015("01") :-
    b_getval(spec, S),
    S.operations.get(s0_at_0) > 0,
    S.operations.get(s0_at_0) = S.operations.get(s1).
        
   
% a016('31') :-
%     % TODO: must not be using PID function
%     analog_input_filter_ms('Fixed to 500-ms filter with ±0.1-Hz hysteresis');
%     (
%         analog_input_filter_ms(Y), 
%         Y >= 62
%     ).

% %volume_control_3G3AX_OP01(false).

% a016(X) :-
%     analog_input_filter_ms(Y),
%     Y =< 61,
%     X is div(Y,2).

%a017("00") :-
    % DriveProgramming Function Parameters are not covered. 
    % 01: Enabled (Start/stop via multifunction
    % input PRG terminal)
    % 02: Enabled (Start/stop via power
    % on/off)

% Multi-step speed, jogging
%a019("00") :-
%    'Binary (16-step selection with 4 terminals)'
%a019("00") :-
%    'Bit (8-step selection with 7 terminals)'
