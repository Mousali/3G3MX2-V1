h001(00, default).
h002(00, default).
h202(00, default).

h003(0.1, "Maximum applicable motor capacity (kw)"):-
	b_getval(spec, S),
	S.get(motor/'1st'/power_kw)  < 0.2,
	!.

h003(0.2, "Maximum applicable motor capacity (kw)"):-
	b_getval(spec, S),
	S.get(motor/'1st'/power_kw)  < 0.4,
	!.

h003(0.4, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 0.55,
   !.

h003(0.55, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 0.75,
   !.

h003(0.75, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 1.1,
   !.

h003(1.1, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 1.5,
   !.

h003(1.5 , "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 2.2,
   !.

h003(2.2, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 3.0,
   !.

h003(3.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 3.7,
   !.

h003(3.7, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 4.0,
   !.

h003(4.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 5.5,
   !.

h003(5.5, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 7.5,
   !.

h003(7.5, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 11.0,
   !.

h003(11.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 15.0,
   !.

h003(15.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'1st'/power_kw)  < 18.5,
   !.

h003(18.5, "Maximum applicable motor capacity (kw)"):-
   !.

h003(0.0, default).

h203(0.1, "Maximum applicable motor capacity (kw)"):-
	b_getval(spec, S),
	S.get(motor/'2nd'/power_kw)  < 0.2,
	!.

h203(0.2, "Maximum applicable motor capacity (kw)"):-
	b_getval(spec, S),
	S.get(motor/'2nd'/power_kw)  < 0.4,
	!.

h203(0.4, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 0.55,
   !.

h203(0.55, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 0.75,
   !.

h203(0.75, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 1.1,
   !.

h203(1.1, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 1.5,
   !.

h203(1.5 , "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 2.2,
   !.

h203(2.2, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 3.0,
   !.

h203(3.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 3.7,
   !.

h203(3.7, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 4.0,
   !.

h203(4.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 5.5,
   !.

h203(5.5, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 7.5,
   !.

h203(7.5, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 11.0,
   !.

h203(11.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 15.0,
   !.

h203(15.0, "Maximum applicable motor capacity (kw)"):-
   b_getval(spec, S),
   S.get(motor/'2nd'/power_kw)  < 18.5,
   !.

h203(18.5, "Maximum applicable motor capacity (kw)"):-
   !.

h203(0.0, default).

h004(Poles, "1st Motor Poles"):-
    b_getval(spec, S),
    Poles = S.get(motor/'1st'/poles),
    Poles =< 8,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h004([], "1st Motor Poles"):-
    b_getval(spec, S),
    S.get(motor/'1st'/poles) > 8,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h004(4, default).

h204(Poles, "2nd Motor Poles"):-
    b_getval(spec, S),
    Poles = S.get(motor/'2nd'/poles),
    Poles =< 8,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h204([], "2nd Motor Poles"):-
    b_getval(spec, S),
    S.get(motor/'2nd'/poles) > 8,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h204(4, default).

h005(V, "1st Speed Response"):-
    b_getval(spec, S),
    V = S.get(motor/'1st'/speed_response),
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h005(100, default).

h205(V, "2nd Speed Response"):-
    b_getval(spec, S),
    V = S.get(motor/'2nd'/speed_response),
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h205(100, default).

h006(V,"1st Stabilization Parameter"):-
    b_getval(spec, S),
    V = S.get(motor/'1st'/stabilization_parameter),
    0 =< V, V =< 255,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h006(100, default).

h206(V,"2nd Stabilization Parameter"):-
    b_getval(spec, S),
    V = S.get(motor/'2nd'/stabilization_parameter),
    0 =< V, V =< 255,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h206(100, default).

h020(R1, "1st Motor Parameter R1 (Winding resistance on primary side)"):-
    b_getval(spec, S),
    R1 = S.get(motor/'1st'/'R1'),
    R1 >= 0.00,
    R1 =< 65.53,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h020([], default).

h220(R1, "2nd Motor Parameter R1 (Winding resistance on primary side)"):-
    b_getval(spec, S),
    R1 = S.get(motor/'2nd'/'R1'),
    R1 >= 0.00,
    R1 =< 65.53,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h220([], default).

h021(R2, "1st Motor Parameter R2 (Winding resistance on secondary side)"):-
    b_getval(spec, S),
    R2 = S.get(motor/'1st'/'R2'),
    R2 >= 0.00,
    R2 =< 65.53,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h021([], default).

h221(R2, "2nd Motor Parameter R2 (Winding resistance on secondary side)"):-
    b_getval(spec, S),
    R2 = S.get(motor/'2nd'/'R2'),
    R2 >= 0.00,
    R2 =< 65.53,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h221([], default).

h022(L, "1st Motor Parameter L (Leakage inductance)"):-
    b_getval(spec, S),
    L = S.get(motor/'1st'/'L'),
    L >= 0.00,
    L =< 655.3,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h022([], default).

h222(L, "2nd Motor Parameter L (Leakage inductance)"):-
    b_getval(spec, S),
    L = S.get(motor/'2nd'/'L'),
    L >= 0.00,
    L =< 655.3,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h222([], default).


h023(Io, "1st Motor Parameter Io (No-load current)"):-
    b_getval(spec, S),
    Io = S.get(motor/'1st'/'Io'),
    Io >= 0.00,
    Io =< 655.3,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h023([], default).

h223(Io, "2nd Motor Parameter Io (No-load current)"):-
    b_getval(spec, S),
    Io = S.get(motor/'2nd'/'Io'),
    Io >= 0.00,
    Io =< 655.3,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h223([], default).


h024(J, "1st Motor Parameter J (Moment of inertia)"):- 
    b_getval(spec, S),
    J = S.get(motor/'1st'/'J'),
    J >= 0.001,
    J =< 9999,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h024([], default).

h224(J, "2nd Motor Parameter J (Moment of inertia)"):- 
    b_getval(spec, S),
    J = S.get(motor/'2nd'/'J'),
    J >= 0.001,
    J =< 9999,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h224([], default).

% Auto-tuning Data
h030([], default).
h230([], default).
h031([], default).
h231([], default).
h032([], default).
h232([], default).
h033([], default).
h233([], default).
h034([], default).
h234([], default).

h050(Slip, "V/f Control With Speed Feedback Slip Compensation Proportional Gain"):-
    b_getval(spec, S),
    Slip = S.get(motor/slip_compensation_proportional_gain),
    Slip >= 0.00,
    Slip =< 10,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h050(0.20, default).

h051(Slip, "V/f Control With Speed Feedback Slip Compensation Integral Gain"):-
    b_getval(spec, S),
    Slip = S.get(motor/slip_compensation_integral_gain),
    Slip >= 0.00,
    Slip =< 1000,
    \+ S.get(motor/'1st'/permanent_magnet),
    !.

h051(2, default).


h102([], default).

h103([], default).

h104(Poles, "PM Motor Pole Number"):-
    b_getval(spec, S),
    Poles = S.get(motor/'1st'/poles),
    Poles =< 8,
    S.get(motor/'1st'/permanent_magnet),
    !.

h104([], default).

h105(A, "PM Motor Rated Current"):-
    b_getval(spec, S),
    A = S.get(motor/'1st'/rated_current),
    A >= 0.00,
    S.get(motor/'1st'/permanent_magnet),
    !.

h105([], default).

h106(R, "PM Motor Parameter R"):-
    b_getval(spec, S),
    R = S.get(motor/'1st'/resistance),
    R >= 0.00,
    R =< 65.53,
    S.get(motor/'1st'/permanent_magnet),
    !.

h106([], default).

h107(Ld, "PM Motor Parameter d-axis Inductance (mH)"):-
    b_getval(spec, S),
    Ld = S.get(motor/'1st'/inductance_d),
    Ld >= 0.00,
    Ld =< 655.3,
    S.get(motor/'1st'/permanent_magnet),
    !.

h107([], default).

h108(Lq, "PM Motor Parameter q-axis Inductance (mH)"):-
    b_getval(spec, S),
    Lq = S.get(motor/'1st'/inductance_q),
    Lq >= S.get(motor/'1st'/inductance_d),
    Lq =< 655.3,
    S.get(motor/'1st'/permanent_magnet),
    !.

h108([], default).

h109(Ke , "PM Motor inductive voltage parameter Vp/(rad/s)"):-
    b_getval(spec, S),
    T = S.get(motor/'1st'/inductive_voltage),
    T >= 0.0001,
    T =< 0.9999,
    Ke is integer(T * 10000),
    S.get(motor/'1st'/permanent_magnet),
    !.

h109(Ke, "PM Motor inductive voltage parameter Vp/(rad/s)"):-
    b_getval(spec, S),
    Ke = S.get(motor/'1st'/inductive_voltage),
    Ke >= 1.000,
    Ke =< 6.553,
    S.get(motor/'1st'/permanent_magnet),
    !.

h109([], default).

h110(J, "PM Motor Moment of Inertia (kg.m^2)"):-
    b_getval(spec, S),
    J = S.get(motor/'1st'/moment_of_inertia),
    J >= 0.001,
    J =< 9999,
    S.get(motor/'1st'/permanent_magnet),
    !.

h110([], default).

% Auto-tuning Data for PM Motors
h111([], default).
h112([], default).
h113([], default).

h116(SR, "PM Motor Speed Response"):-
    b_getval(spec, S),
    SR = S.get(motor/'1st'/speed_response),
    SR >= 0.00,
    SR =< 1000,
    S.get(motor/'1st'/permanent_magnet),
    !.

h116(100, default).

h117(Is, "PM Motor Starting Current (%)"):-
    b_getval(spec, S),
    Is = S.get(motor/'1st'/starting_current),
    Is >= 0.00,
    Is =< 100.00,
    S.get(motor/'1st'/permanent_magnet),
    !.

h117(70.00, default).

h118(Ts, "PM Motor Starting Time (s)"):-
    b_getval(spec, S),
    Ts = S.get(motor/'1st'/starting_time),
    Ts >= 0.00,
    Ts =< 60.00,
    S.get(motor/'1st'/permanent_magnet),
    !.

h118(1.00, default).

h119(100, "PM Motor Speed Stabilization Parameter (%)"):-
    b_getval(spec, S),
    h119 = S.get(motor/'1st'/speed_stabilization_parameter),
    h119 >= 0,
    h119 =< 120,
    S.get(motor/'1st'/permanent_magnet),
    !.

h119(100, default).

h121(Fmin, "PM Motor Minimum Frequency (%)"):-
    b_getval(spec, S),
    Fmin = S.get(motor/'1st'/minimum_frequency),
    Fmin >= 0.00,
    Fmin =< 25.00,
    S.get(motor/'1st'/permanent_magnet),
    !.

h121(8.0, default).

h122(Ino, "PM Motor No-load Current (%)"):-
    b_getval(spec, S),
    Ino = S.get(motor/'1st'/no_load_current),
    Ino >= 0.00,
    Ino =< 100.00,
    S.get(motor/'1st'/permanent_magnet),
    !.

h122(10.00, default).

h123(01, "PM Motor Initial Pole Position Estimation Starting Method"):-
    b_getval(spec, S),
    S.get(motor/'1st'/initial_pole_position_estimation_starting_method),
    S.get(motor/'1st'/permanent_magnet),
    !.

h123(00, default).

h131(Twait, "PM Motor Initial Pole Position Estimation 0V Waiting Times"):-
    b_getval(spec, S),
    Twait = S.get(motor/'1st'/initial_pole_position_estimation_waiting_time),
    Twait >= 0,
    Twait =< 255,
    S.get(motor/'1st'/permanent_magnet),
    !.

h131(10, default).

h132(Tdet, "PM Motor Initial Pole Position Estimation Detection Waiting Times"):-
    b_getval(spec, S),
    Tdet = S.get(motor/'1st'/initial_pole_position_estimation_detection_waiting_time),
    Tdet >= 0,
    Tdet =< 255,
    S.get(motor/'1st'/permanent_magnet),
    !.

h132(10, default).

h133(Tdet, "PM Motor Initial Pole Position Estimation Detection Times"):-
    b_getval(spec, S),
    Tdet = S.get(motor/'1st'/initial_pole_position_estimation_detection_time),
    Tdet >= 0,
    Tdet =< 255,
    S.get(motor/'1st'/permanent_magnet),
    !.

h133(30, default).

h134(Vg, "PM Initial Pole Position Estimation Voltage Gain (%)"):-
    b_getval(spec, S),
    Vg = S.get(motor/'1st'/initial_pole_position_estimation_voltage_gain),
    Vg >= 0,
    Vg =< 200,
    S.get(motor/'1st'/permanent_magnet),
    !.

h134(100, default).
