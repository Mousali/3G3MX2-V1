:- qcompile("model_part_number.pl").

inverter_type(X) :-
    inverter_Nameplate_model(S),
    sub_string(S,13,2,_,X).

inverter_maximum_motor_capacity_kw(X) :-
    inverter_Nameplate_model(S),
    sub_string(S,9,3,_,Ns),
    number_string(N,Ns),
    X is N/10.

inverter_voltage_class('Single phase 200 VAC (200-V class)') :-
    inverter_Nameplate_model(S),
    sub_string(S,8,1,_,'B').

inverter_voltage_class('3-phase 200 VAC (200-V class)') :-
    inverter_Nameplate_model(S),
    sub_string(S,8,1,_,2).

inverter_voltage_class('3-phase 400 VAC (400-V class)') :-
    inverter_Nameplate_model(S),
    sub_string(S,8,1,_,4).
    
inverter_enclosure_rating('Panel-mounting (IP10 or higher) or closed wall-mounting models') :-
    inverter_Nameplate_model(S),
    sub_string(S,_,1,7,'A').