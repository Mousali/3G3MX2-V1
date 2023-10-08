% Load default predicates
:- consult("defaults/group_a").
:- consult("defaults/group_b").
:- consult("defaults/group_c").
:- consult("defaults/group_d").
:- consult("defaults/group_f").
:- consult("defaults/group_h").
:- consult("defaults/group_p").
:- consult("defaults/group_u").

:- dynamic setup/1.

setup(YAML):- 
    yaml_read("setup.yaml", YAML).

% :- 
%     setup(YAML),
%     writef('Model: %10r\n', [YAML.inverter.model]).
    
a001("00") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (Volume)",
    YAML.inverter.accessories = "3G3AX-OP01".

a001("01") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Control circuit terminal block (Analog input)".

a001("01") :-
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "voltage (FV)".

a001("01") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "current (FI)".

a001("02") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (F001)".

a001("03") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Modbus communication".

a001("04") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Option".

a001("06") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Pulse train frequency".

a001("07") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "DriveProgramming".

a001("10") :- 
    setup(YAML),
    YAML.motor.get('1st').get(speed_reference,"Digital Operator (F001)") = "Operation function output".

% A201
a201("00") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (Volume)",
    YAML.inverter.accessories = "3G3AX-OP01".

a201("01") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Control circuit terminal block (Analog input)".

a201("01") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "voltage (FV)".

a201("01") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "current (FI)".

a201("02") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Digital Operator (F001)".

a201("03") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Modbus communication".

a201("04") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Option".

a201("06") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Pulse train frequency".

a201("07") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "DriveProgramming".

a201("10") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(speed_reference,"Digital Operator (F001)") = "Operation function output".

% A002 1st RUN Command Selection
a002("01") :-
    setup(YAML),
    YAML.motor.get('1st').get('run_command_source',"Digital Operator") = "Control terminal block (Drive-Programming)".

a002("02") :- 
    setup(YAML),
    YAML.motor.get('1st').get('run_command_source',"Digital Operator") = "Digital Operator".

a002("03") :- 
    setup(YAML),
    YAML.motor.get('1st').get('run_command_source',"Digital Operator") = "Modbus communication".

a002("04") :- 
    setup(YAML),
    YAML.motor.get('1st').get('run_command_source',"Digital Operator") = "Option".

% A202 2st RUN Command Selection
a202("01") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(run_command_source,"Digital Operator") ="Control terminal block (Drive-Programming)".

a202("02") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(run_command_source,"Digital Operator") = "Digital Operator".

a202("03") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(run_command_source,"Digital Operator") = "Modbus communication".

a202("04") :- 
    setup(YAML),
    YAML.motor.get('2nd').get(run_command_source,"Digital Operator") = "Option".

% % A003
% a003(X) :- 
%     setup(YAML),
%     YAML.motor.'2nd'.run_command_source =     
%     motor1_base_operating_frequency(X),
%     X >= 30,
%     a004(Y),
%     X =< Y.

% a203(X) :- 
%     motor2_base_operating_frequency(X),
%     X >= 30,
%     a204(Y),
%     X =< Y.

% % motor maximum operating frequency
% a004(X) :- 
%     motor1_maximum_operating_frequency(X),
%     X =< 400,
%     not(inverter_mode('Induction motor high-frequency')).
    
% a004(X) :- 
%     motor1_maximum_operating_frequency(X),
%     X =< 580,
%     inverter_mode('Induction motor high-frequency').
    
% a204(X) :- 
%     motor2_maximum_operating_frequency(X),
%     X =< 400,
%     not(inverter_mode('Induction motor high-frequency')).
    
% a204(X) :- 
%     motor2_maximum_operating_frequency(X),
%     X =< 580,
%     inverter_mode('Induction motor high-frequency').
    
% % A005 FV/FI Selection
% % Switch between FV (Voltage) and FI (Current)
% a005("00") :-
%     motor1_operation_speed_control_source('voltage (FV)').

% a005("00") :-
%     motor1_operation_speed_control_source('current (FI)').
    
% % Switch between FV (Voltage) and volume
% a005('02') :-
%     volume_control_3G3AX_OP01(true),
%     motor1_operation_speed_control_source('voltage (FV)').
    
% a005('02') :-
%     volume_control_3G3AX_OP01(true),
%     motor1_operation_speed_control_source('Digital Operator (Volume)').
    
% % 'witch between FI (Current) and volume
% a005('03') :-
%     volume_control_3G3AX_OP01(true),
%     motor1_operation_speed_control_source('current (FI)').

% a005('03') :-
%     volume_control_3G3AX_OP01(true),
%     motor1_operation_speed_control_source('Digital Operator (Volume)').

% a141('02') :- 
%     motor1_speed_control_method('voltage').
    
% a141('03') :- 
%     motor1_speed_control_method('current').


% a011(F1) :-
%     a003(A003),
%     f1_at_i0(F1,_),
%     F1 =< A003.


% a101(F1) :-
%     a003(A003),
%     f1_at_i0(F1,_),
%     F1 =< A003.

% a161(F1) :-
%     a003(A003),
%     f1_at_i0(F1,_),
%     F1 =< A003.

% a012(F2) :-
%     a003(A003),
%     f2_at_i1(F2,_),
%     F2 =< A003.

% a102(F2) :-
%     a003(A003),
%     f2_at_i1(F2,_),
%     F2 =< A003.

% a162(F2) :-
%     a003(A003),
%     f2_at_i1(F2,_),
%     F2 =< A003.

% a013(I0) :-
%     f1_at_i0(_,I0),
%     f2_at_i1(_,I1),
%     I0 < I1.
    
% a103(I0) :-
%     f1_at_i0(_,I0),
%     f2_at_i1(_,I1),
%     I0 < I1.

% a163(I0) :-
%     f1_at_i0(_,I0),
%     f2_at_i1(_,I1),
%     I0 < I1.

% a014(I1) :-
%     f1_at_i0(_,I0),
%     f2_at_i1(_,I1),
%     I0 < I1.
    
% a104(I1) :-
%     f1_at_i0(_,I0),
%     f2_at_i1(_,I1),
%     I0 < I1.

% a164(I1) :-
%     f1_at_i0(_,I0),
%     f2_at_i1(_,I1),
%     I0 < I1.

% a015("00") :-
%     f0_at_0(0).
    
% a015("01") :-
%     f0_at_0(F0),
%     f1_at_i0(F0,_),
%     F0 > 0.

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




% cycle through all parameters.
% Print if a parameter value is not the same as default. 
:- findall([Upper_X, Y], 
        ( 
            current_predicate(X/1),
            re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",X),
            call(X,Y), 
            string_upper(X,Upper_X), 
            atom_concat(X,'_default', X_default),
            call(X_default,Y_default),
            Y \= Y_default,
            writef('%w : %6r\n', [Upper_X,Y])            
        ), _).
