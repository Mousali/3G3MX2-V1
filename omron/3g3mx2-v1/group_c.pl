value_function_text(00, Text, Function) :-
    Function = "FW (Forward)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(01, Text, Function) :-
    Function = "RV (Reverse)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(02, Text, Function) :-
    Function = "CF1 (Multi-step speed setting binary 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(03, Text, Function) :-
    Function = "CF2 (Multi-step speed setting binary 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(04, Text, Function) :-
    Function = "CF3 (Multi-step speed setting binary 3)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(05, Text, Function) :-
    Function = "CF4 (Multi-step speed setting binary 4)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(06, Text, Function) :-
    Function = "JG (Jogging)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(07, Text, Function) :-
    Function = "DB (External DC injection braking)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(08, Text, Function) :-
    Function = "SET (2nd control)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(09, Text, Function) :-
    Function = "2CH (2-step acceleration/deceleration)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(11, Text, Function) :-
    Function = "FRS (Free-run stop)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(12, Text, Function) :-
    Function = "EXT (External trip)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(13, Text, Function) :-
    Function = "USP (Power recovery restart prevention function)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(14, Text, Function) :-
    Function = "CS (Commercial switching)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(15, Text, Function) :-
    Function = "SFT (Soft lock)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(16, Text, Function) :-
    Function = "AT (Analog input switching)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(18, Text, Function) :-
    Function = "RS (Reset)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(19, Text, Function) :-
    Function = "TH (PTC thermistor thermal protection, C005 only)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(20, Text, Function) :-
    Function = "STA (3-wire start)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(21, Text, Function) :-
    Function = "STP (3-wire stop)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(22, Text, Function) :-
    Function = "F/R (3-wire forward/reverse)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(23, Text, Function) :-
    Function = "PID (PID disabled)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(24, Text, Function) :-
    Function = "PIDC (PID integral reset)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(27, Text, Function) :-
    Function = "UP (Remote operation accelerated)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(28, Text, Function) :-
    Function = "DWN (Remote operation decelerated)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(29, Text, Function) :-
    Function = "UDC (Remote operation data clear)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(31, Text, Function) :-
    Function = "OPE (Forced operator function)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(32, Text, Function) :-
    Function = "SF1 (Multi-step speed setting bit 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(33, Text, Function) :-
    Function = "SF2 (Multi-step speed setting bit 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(34, Text, Function) :-
    Function = "SF3 (Multi-step speed setting bit 3)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(35, Text, Function) :-
    Function = "SF4 (Multi-step speed setting bit 4)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(36, Text, Function) :-
    Function = "SF5 (Multi-step speed setting bit 5)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(37, Text, Function) :-
    Function = "SF6 (Multi-step speed setting bit 6)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(38, Text, Function) :-
    Function = "SF7 (Multi-step speed setting bit 7)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(39, Text, Function) :-
    Function = "OLR (Overload limit switching)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(40, Text, Function) :-
    Function = "TL (Torque limit enabled)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(41, Text, Function) :-  
    Function = "TRQ1 (Torque limit switching 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(42, Text, Function) :-
    Function = "TRQ2 (Torque limit switching 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(44, Text, Function) :-
    Function = "BOK (Brake confirmation)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(46, Text, Function) :-
    Function = "LAC (LAD cancel)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(47, Text, Function) :-
    Function = "PCLR (Current position clear)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(50, Text, Function) :-
    Function = "ADD (Set frequency A145 addition)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(51, Text, Function) :-
    Function = "F-TM (Forced terminal block)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(52, Text, Function) :-
    Function = "ATR (Torque command input permission)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(53, Text, Function) :-
    Function = "KHC (Integrated power clear)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(56, Text, Function) :-
    Function = "MI1 (General-purpose input 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(57, Text, Function) :-
    Function = "MI2 (General-purpose input 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(58, Text, Function) :-
    Function = "MI3 (General-purpose input 3)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(59, Text, Function) :-
    Function = "MI4 (General-purpose input 4)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(60, Text, Function) :-
    Function = "MI5 (General-purpose input 5)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(61, Text, Function) :-
    Function = "MI6 (General-purpose input 6)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(62, Text, Function) :-
    Function = "MI7 (General-purpose input 7)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(65, Text, Function) :-
    Function = "AHD (Analog command held)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(66, Text, Function) :-
    Function = "CP1 (Position command selection 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(67, Text, Function) :-
    Function = "CP2 (Position command selection 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(68, Text, Function) :-
    Function = "CP3 (Position command selection 3)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(69, Text, Function) :-
    Function = "ORL (Origin search limit signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(70, Text, Function) :-
    Function = "ORG (Origin search startup signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(73, Text, Function) :-
    Function = "SPD (Speed/Position switching)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(77, Text, Function) :-
    Function = "GS1 (GS1 input, C003 only)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(78, Text, Function) :-
    Function = "GS2 (GS2 input, C004 only)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(81, Text, Function) :-
    Function = "485 (Start co-inverter communication)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(82, Text, Function) :-
    Function = "PRG (DriveProgramming start)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(83, Text, Function) :-
    Function = "HLD (Retain output frequency)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(84, Text, Function) :-
    Function = "ROK (Permission of RUN command)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(85, Text, Function) :-
    Function = "EB (Rotation direction detection, C007 only)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(86, Text, Function) :-
    Function = "DISP (Display fixed)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(91, Text, Function) :-
    Function = "PSET (Preset position)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(255, Text, Function) :-
    Function = "no (No allocation)",
    #fuzzy_match_key_value(Text,Function).

value_function_text(00, Text, Function) :-
    Function = "RUN (Signal during RUN)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(01, Text, Function) :-
    Function = "FA1 (Constant speed arrival signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(02, Text, Function) :-
    Function = "FA2 (Set frequency exceeded signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(03, Text, Function) :-
    Function = "OL (Overload warning)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(04, Text, Function) :-
    Function = "OD (Excessive PID deviation)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(05, Text, Function) :-
    Function = "AL (Alarm signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(06, Text, Function) :-
    Function = "FA3 (Set-frequency only signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(07, Text, Function) :-
    Function = "OTQ (Overtorque/Undertorque signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(09, Text, Function) :-
    Function = "UV (Signal during undervoltage)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(10, Text, Function) :-
    Function = "TRQ (Torque limit)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(11, Text, Function) :-
    Function = "RNT (RUN time over)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(12, Text, Function) :-
    Function = "ONT (Power ON time over)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(13, Text, Function) :-
    Function = "THM (Electronic thermal warning)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(19, Text, Function) :-
    Function = "BRK (Brake release)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(20, Text, Function) :-
    Function = "BER (Brake error)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(21, Text, Function) :-
    Function = "ZS (0-Hz detection signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(22, Text, Function) :-
    Function = "DSE (Excessive speed deviation)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(23, Text, Function) :-
    Function = "POK (Position ready)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(24, Text, Function) :-
    Function = "FA4 (Set frequency exceeded signal 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(25, Text, Function) :-
    Function = "FA5 (Set-frequency only signal 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(26, Text, Function) :-
    Function = "OL2 (Overload warning 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(27, Text, Function) :-
    Function = "FVDc (Analog FV disconnection detection)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(28, Text, Function) :-
    Function = "FIDc (Analog FI disconnection detection)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(31, Text, Function) :-
    Function = "FBV (PID feedback comparison signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(32, Text, Function) :-
    Function = "NDc (Communications disconnection detection)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(33, Text, Function) :-
    Function = "LOG1 (Logic operation output 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(34, Text, Function) :-
    Function = "LOG2 (Logic operation output 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(35, Text, Function) :-
    Function = "LOG3 (Logic operation output 3)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(39, Text, Function) :-
    Function = "WAC (Capacitor life warning signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(40, Text, Function) :-
    Function = "WAF (Cooling fan life warning signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(41, Text, Function) :-
    Function = "FR (Starting contact signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(42, Text, Function) :-
    Function = "OHF (Cooling fin overheat warning)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(43, Text, Function) :-
    Function = "LOC (Low current signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(44, Text, Function) :-
    Function = "MO1 (General-purpose output 1)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(45, Text, Function) :-
    Function = "MO2 (General-purpose output 2)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(46, Text, Function) :-
    Function = "MO3 (General-purpose output 3)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(50, Text, Function) :-
    Function = "IRDY (Operation ready)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(51, Text, Function) :-
    Function = "FWR (Forward run signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(52, Text, Function) :-
    Function = "RVR (Reverse run signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(53, Text, Function) :-
    Function = "MJA (Fatal fault signal)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(54, Text, Function) :-
    Function = "WCFV (Window comparator FV)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(55, Text, Function) :-
    Function = "WCFI (Window comparator FI)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(58, Text, Function) :-
    Function = "FREF (Frequency reference source)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(59, Text, Function) :-
    Function = "REF (RUN command source)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(60, Text, Function) :-
    Function = "SETM (Motor 2 selection)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(62, Text, Function) :-
    Function = "EDM (Safety device monitor)*1",
    #fuzzy_match_key_value(Text,Function).
value_function_text(63, Text, Function) :-
    Function = "OPO (Option)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(00, Text, Function) :-  
    Function = "Output frequency",
    #fuzzy_match_key_value(Text,Function).
value_function_text(01, Text, Function) :-
    Function = "Output current",
    #fuzzy_match_key_value(Text,Function).
value_function_text(02, Text, Function) :-
    Function = "Output torque (Only in the sensorless vector control)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(03, Text, Function) :-
    Function = "Digital output frequency",
    #fuzzy_match_key_value(Text,Function).
value_function_text(04, Text, Function) :-
    Function = "Output voltage",
    #fuzzy_match_key_value(Text,Function).
value_function_text(05, Text, Function) :-
    Function = "Input power",
    #fuzzy_match_key_value(Text,Function).
value_function_text(06, Text, Function) :-
    Function = "Electronic thermal load rate",
    #fuzzy_match_key_value(Text,Function).
value_function_text(07, Text, Function) :-
    Function = "LAD frequency",
    #fuzzy_match_key_value(Text,Function).
value_function_text(08, Text, Function) :-
    Function = "Digital current monitor",
    #fuzzy_match_key_value(Text,Function).
value_function_text(10, Text, Function) :-
    Function = "Cooling fin temperature",
    #fuzzy_match_key_value(Text,Function).
value_function_text(11, Text, Function) :-
    Function = "Output torque (signed) (Only in the sensorless vector control)",
    #fuzzy_match_key_value(Text,Function).
value_function_text(12, Text, Function) :-
    Function = "DriveProgramming (YA(0))",
    #fuzzy_match_key_value(Text,Function).
value_function_text(13, Text, Function) :-
    Function = "DriveProgramming (YA(1))",
    #fuzzy_match_key_value(Text,Function).
value_function_text(15, Text, Function) :-
    Function = "Pulse train input monitor",
    #fuzzy_match_key_value(Text,Function).
value_function_text(16, Text, Function) :-
    Function = "Option (No applicable Option)",
    #fuzzy_match_key_value(Text,Function).


c001(V, Text):-
    value_function_text(V, S.get(inputs/s1/function), Text),
    !.
c001(00, default).

c002(V, Text):-
    value_function_text(V, S.get(inputs/s2/function), Text),
    !.
c002(01, default).

c003(V, Text):-
    value_function_text(V, S.get(inputs/s3/function), Text),
    !.
c003(18, default).

c004(V, Text):-
    value_function_text(V, S.get(inputs/s4/function), Text),
    !.
c004(12, default).

c005(V, Text):-
    value_function_text(V, S.get(inputs/s5/function), Text),
    !.
c005(02, default).

c006(V, Text):-
    value_function_text(V, S.get(inputs/s6/function), Text),
    !.
c006(03, default).

c007(V, Text):-
    value_function_text(V, S.get(inputs/s7/function), Text),
    !.
c007(06, default).


c011(01, "Normally Closed (NC)") :-
    b_getval(spec, S),
    S.get(inputs/s1/normally_closed),
    \+ c001(18, _),
    !.

c011(00, default).

c012(01, "Normally Open (NO)") :-
    b_getval(spec, S),
    S.get(inputs/s2/normally_open),
    \+ c002(18, _),
    !.

c012(00, default).

c013(01, "Normally Closed (NC)") :-
    b_getval(spec, S),
    S.get(inputs/s3/normally_closed),
    \+ c003(18, _),
    !.

c013(00, default).

c014(01, "Normally Open (NO)") :-
    b_getval(spec, S),
    S.get(inputs/s4/normally_open),
    \+ c004(18, _),
    !.

c014(00, default).

c015(01, "Normally Closed (NC)") :-
    b_getval(spec, S),
    S.get(inputs/s5/normally_closed),
    \+ c005(18, _),
    !.

c015(00, default).

c016(01, "Normally Open (NO)") :-
    b_getval(spec, S),
    S.get(inputs/s6/normally_open),
    \+ c006(18, _),
    !.

c016(00, default).

c017(01, "Normally Closed (NC)") :-
    b_getval(spec, S),
    S.get(inputs/s7/normally_closed),
    \+ c007(18, _),
    !.

c017(00, default).

% outputs

c021(V, Text):-
    value_function_text(V, S.get(outputs/p1/function), Text),
    !.
c021(00, default).
c022(V, Text):-
    value_function_text(V, S.get(outputs/p2/function), Text),
    !.
c022(01, default).
c026(V, Text):-
    value_function_text(V, S.get(outputs/relay/function), Text),
    !.
c026(05, default).

% Analog monitor
c027(V, Text):-
    value_function_text(V, S.get(outputs/MP/function), Text),
    !.
c027(07, default).

c028(V, Text):-
    value_function_text(V, S.get(outputs/AM/function), Text),
    !.
c028(07, default).

c030([], default).

% Multi-function output terminals
c031(V, Text):-
    b_getval(spec, S),
    S.get(outputs/p1/normally_closed),
    !.
c031(00, default).
c032(V, Text):-
    b_getval(spec, S),
    S.get(outputs/p2/normally_closed),
    !.
c032(00, default).
c036(V, Text):-
    b_getval(spec, S),
    S.get(outputs/relay/normally_closed),
    !.
c036(01, default).

% Level and output terminal status

% Low Current Signal Output Selection

c038(00, "Enabled during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
	c021(_,"LOC (Low current signal)"),
    S.get(outputs/p1/low_current_signal) == "accel_decel_and_constant",
    !.

c038(01, "Enabled during constant speed") :-
    b_getval(spec, S),
	c021(_,"LOC (Low current signal)"),
    S.get(outputs/p1/low_current_signal) == "constant_speed",
    !.

c038(00, "Enabled during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
	c022(_,"LOC (Low current signal)"),
    S.get(outputs/p2/low_current_signal) == "accel_decel_and_constant",
    !.

c038(01, "Enabled during constant speed") :-
    b_getval(spec, S),
	c022(_,"LOC (Low current signal)"),
    S.get(outputs/p1/low_current_signal) == "constant_speed",
    !.

c038(00, "Enabled during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
	c026(_,"LOC (Low current signal)"),
    S.get(outputs/relay/low_current_signal) == "accel_decel_and_constant",
    !.

c038(01, "Enabled during constant speed") :-
    b_getval(spec, S),
	c026(_,"LOC (Low current signal)"),
    S.get(outputs/relay/low_current_signal) == "constant_speed",
    !.

c038(01, default).

% Low Current Detection Level
c039([], default).

c040(00, "Enabled during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
	(
		c021(_,"OL (Overload warning)");
		c021(_,"OL2 (Overload warning 2)")
	),
    S.get(outputs/p1/overload_warning_signal) == "accel_decel_and_constant",
    !.

c040(01, "Enabled during constant speed") :-
    b_getval(spec, S),
	(
		c021(_,"OL (Overload warning)");
		c021(_,"OL2 (Overload warning 2)")
	),
    S.get(outputs/p1/overload_warning_signal) == "constant_speed",
    !.

c040(00, "Enabled during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
    (
        c022(_,"OL (Overload warning)");
        c022(_,"OL2 (Overload warning 2)")
    ),
    S.get(outputs/p2/overload_warning_signal) == "accel_decel_and_constant",
    !.
    
c040(01, "Enabled during constant speed") :-
    b_getval(spec, S),
    (
        c022(_,"OL (Overload warning)");
        c022(_,"OL2 (Overload warning 2)")
    ),
    S.get(outputs/p2/overload_warning_signal) == "constant_speed",
    !.

c040(00, "Enabled during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
    (
        c026(_,"OL (Overload warning)");
        c026(_,"OL2 (Overload warning 2)")
    ),
    S.get(outputs/relay/overload_warning_signal) == "accel_decel_and_constant",
    !.

c040(01, "Enabled during constant speed") :-
    b_getval(spec, S),
    (
        c026(_,"OL (Overload warning)");
        c026(_,"OL2 (Overload warning 2)")
    ),
    S.get(outputs/relay/overload_warning_signal) == "constant_speed",
    !.

c040(01, default).
c041([], default).
c241([], default).


c042(F, "Arrival Frequency During Acceleration signal 1 (Hz)"):-
    b_getval(spec, S),
	(
		c021(_,"FA2 (Set frequency exceeded signal)");
		c021(_,"FA3 (Set-frequency only signal)")
	),
    F #= S.get(outputs/p1/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
 
c042(F, "Arrival Frequency During Acceleration signal 2 (Hz)"):-
    b_getval(spec, S),
	(
		c021(_,"FA4 (Set frequency exceeded signal 2)");
		c021(_,"FA5 (Set-frequency only signal 2)")
	),
    F #= S.get(outputs/p1/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
 
c042(F, "Arrival Frequency During Acceleration signal 1 (Hz)"):-
    b_getval(spec, S),
	(
		c022(_,"FA2 (Set frequency exceeded signal)");
		c022(_,"FA3 (Set-frequency only signal)")
	),
    F #= S.get(outputs/p2/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
 
c042(F, "Arrival Frequency During Acceleration signal 2 (Hz)"):-
    b_getval(spec, S),
	(
		c022(_,"FA4 (Set frequency exceeded signal 2)");
		c022(_,"FA5 (Set-frequency only signal 2)")
	),
    F #= S.get(outputs/p2/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
 
c042(F, "Arrival Frequency During Acceleration signal 1 (Hz)"):-
    b_getval(spec, S),
	(
		c026(_,"FA2 (Set frequency exceeded signal)");
		c026(_,"FA3 (Set-frequency only signal)")
	),
    F #= S.get(outputs/relay/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
 
c042(F, "Arrival Frequency During Acceleration signal 2 (Hz)"):-
    b_getval(spec, S),
	(
		c026(_,"FA4 (Set frequency exceeded signal 2)");
		c026(_,"FA5 (Set-frequency only signal 2)")
	),
    F #= S.get(outputs/relay/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
 
c042(0.00, default).

% deceleration_arrival_signal_rpm
c043(F, "Arrival Frequency During Deceleration signal 1 (Hz)"):-
    b_getval(spec, S),
	(
		c021(_,"FA2 (Set frequency exceeded signal)");
		c021(_,"FA3 (Set-frequency only signal)")
	),
    F #= S.get(outputs/p1/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c043(F, "Arrival Frequency During Deceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c021(_,"FA4 (Set frequency exceeded signal 2)");
        c021(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/p1/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.  

c043(F, "Arrival Frequency During Deceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c022(_,"FA2 (Set frequency exceeded signal)");
        c022(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/p2/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c043(F, "Arrival Frequency During Deceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c022(_,"FA4 (Set frequency exceeded signal 2)");
        c022(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/p2/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c043(F, "Arrival Frequency During Deceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c026(_,"FA2 (Set frequency exceeded signal)");
        c026(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/relay/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c043(F, "Arrival Frequency During Deceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c026(_,"FA4 (Set frequency exceeded signal 2)");
        c026(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/relay/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c043(0.00, default).

c044(P, "OD signal output judgment level"):-
    b_getval(spec, S),
    P #= S.get("PID"/deviation_excessive_level),
    !.

c044(3.0, default).

c045(F, "Arrival Frequency During Acceleration signal 1 (Hz)"):-
    b_getval(spec, S),
	(
		c021(_,"FA2 (Set frequency exceeded signal)");
		c021(_,"FA3 (Set-frequency only signal)")
	),
    F #= S.get(outputs/p1/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c045(F, "Arrival Frequency During Acceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c021(_,"FA4 (Set frequency exceeded signal 2)");
        c021(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/p1/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c045(F, "Arrival Frequency During Acceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c022(_,"FA2 (Set frequency exceeded signal)");
        c022(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/p2/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c045(F, "Arrival Frequency During Acceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c022(_,"FA4 (Set frequency exceeded signal 2)");
        c022(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/p2/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c045(F, "Arrival Frequency During Acceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c026(_,"FA2 (Set frequency exceeded signal)");
        c026(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/relay/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c045(F, "Arrival Frequency During Acceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c026(_,"FA4 (Set frequency exceeded signal 2)");
        c026(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/relay/acceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
c045(0.00, default).

c046(F, "Arrival Frequency During Deceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c021(_,"FA2 (Set frequency exceeded signal)");
        c021(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/p1/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c046(F, "Arrival Frequency During Deceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c021(_,"FA4 (Set frequency exceeded signal 2)");
        c021(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/p1/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c046(F, "Arrival Frequency During Deceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c022(_,"FA2 (Set frequency exceeded signal)");
        c022(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/p2/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c046(F, "Arrival Frequency During Deceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c022(_,"FA4 (Set frequency exceeded signal 2)");
        c022(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/p2/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.
c046(F, "Arrival Frequency During Deceleration signal 1 (Hz)"):-
    b_getval(spec, S),
    (
        c026(_,"FA2 (Set frequency exceeded signal)");
        c026(_,"FA3 (Set-frequency only signal)")
    ),
    F #= S.get(outputs/relay/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c046(F, "Arrival Frequency During Deceleration signal 2 (Hz)"):-
    b_getval(spec, S),
    (
        c026(_,"FA4 (Set frequency exceeded signal 2)");
        c026(_,"FA5 (Set-frequency only signal 2)")
    ),
    F #= S.get(outputs/relay/deceleration_arrival_signal_rpm) * S.get(motor/'1st'/poles) // 120,
    !.

c046(0.00, default).

c047(1.00, default).

c052(P, "FBV signal output judgment level (%)"):-
    b_getval(spec, S),
    P #= S.get("PID"/feedback_comparison_signal_off_level),
    !.

c052(100.0, default).

c053(P, "FBV signal output judgment level (%)"):-
    b_getval(spec, S),
    P #= S.get("PID"/feedback_comparison_signal_on_level),
    !.
c053(0.0, default).

c054(00, "Overtorque") :-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p1/overtorque_undertorque_selection) == "overtorque",
    !.
c054(01, "Undertorque") :-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p1/overtorque_undertorque_selection) == "undertorque",
    !.
c054(00, "Overtorque") :-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p2/overtorque_undertorque_selection) == "overtorque",
    !.
c054(01, "Undertorque") :-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p2/overtorque_undertorque_selection) == "undertorque",
    !.
c054(00, "Overtorque") :-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/relay/overtorque_undertorque_selection) == "overtorque",
    !.
c054(01, "Undertorque") :-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/relay/overtorque_undertorque_selection) == "undertorque",
    !.
c054(00, default).

c055(P, "OTQ signal output level during Forward Power Running (%)"):-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p1/overtorque_undertorque_level_forward_power_running),
    !.
c055(P, "OTQ signal output level during Forward Regeneration (%)"):-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p2/overtorque_undertorque_level_forward_power_running),
    !.
c055(P, "OTQ signal output level during Forward Power Running (%)"):-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/relay/overtorque_undertorque_level_forward_power_running),
    !.
c055(100, default).

c056(P, "OTQ signal output level during Revers Regeneration (%)"):-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p1/overtorque_undertorque_level_reverse_regeneration),
    !.
c056(P, "OTQ signal output level during Reverse Power Running (%)"):-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p2/overtorque_undertorque_level_reverse_regeneration),
    !.
c056(P, "OTQ signal output level during Reverse Regeneration (%)"):-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/relay/overtorque_undertorque_level_reverse_regeneration),
    !.
c056(100, default).

c057(P, "OTQ signal output level during Reverse Power Running (%)"):-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p1/overtorque_undertorque_level_reverse_power_running),
    !.
c057(P, "OTQ signal output level during Forward Regeneration (%)"):-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p2/overtorque_undertorque_level_reverse_power_running),
    !.
c057(P, "OTQ signal output level during Reverse Power Running (%)"):-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/relay/overtorque_undertorque_level_reverse_power_running),
    !.
c057(100, default).

c058(P, "OTQ signal output level during Forward Regeneration (%)"):-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p1/overtorque_undertorque_level_forward_regeneration),
    !.
c058(P, "OTQ signal output level during Reverse Power Running (%)"):-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/p2/overtorque_undertorque_level_forward_regeneration),
    !.
c058(P, "OTQ signal output level during Forward Regeneration (%)"):-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    P #= S.get(outputs/relay/overtorque_undertorque_level_forward_regeneration),
    !.
c058(100, default).

c059(00, "OTQ signal output during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p1/overtorque_undertorque_signal_operation) == "accel_decel_and_constant",
    !.
c059(01, "OTQ signal output during constant speed") :-
    b_getval(spec, S),
    c021(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p1/overtorque_undertorque_signal_operation) == "constant_speed",
    !.
c059(00, "OTQ signal output during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p2/overtorque_undertorque_signal_operation) == "accel_decel_and_constant",
    !.
c059(01, "OTQ signal output during constant speed") :-
    b_getval(spec, S),
    c022(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/p2/overtorque_undertorque_signal_operation) == "constant_speed",
    !.
c059(00, "OTQ signal output during acceleration/deceleration and constant speed") :-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/relay/overtorque_undertorque_signal_operation) == "accel_decel_and_constant",
    !.
c059(01, "OTQ signal output during constant speed") :-
    b_getval(spec, S),
    c026(_,"OTQ (Overtorque/Undertorque signal)"),
    S.get(outputs/relay/overtorque_undertorque_signal_operation) == "constant_speed",
    !.
c059(01, default).

c061(P, "Electronic thermal warning signal output level (%)") :-
    b_getval(spec, S),
    c021(_,"THM (Electronic thermal warning)"),
    P #= S.get(outputs/p1/thermal_warning_signal_level),
    !.
c061(P, "Electronic thermal warning signal output level (%)") :-
    b_getval(spec, S),
    c022(_,"THM (Electronic thermal warning)"),
    P #= S.get(outputs/p2/thermal_warning_signal_level),
    !.
c061(P, "Electronic thermal warning signal output level (%)") :-
    b_getval(spec, S),
    c026(_,"THM (Electronic thermal warning)"),
    P #= S.get(outputs/relay/thermal_warning_signal_level),
    !.
c061(90, default).

c063(F, "0 Hz detection signal output level (Hz)") :-
    b_getval(spec, S),
    c021(_,"ZS (0 Hz detection signal)"),
    F #= S.get(outputs/p1/zero_speed_detection_level),
    !.
c063(F, "0 Hz detection signal output level (Hz)") :-
    b_getval(spec, S),
    c022(_,"ZS (0 Hz detection signal)"),
    F #= S.get(outputs/p2/zero_speed_detection_level),
    !.
c063(F, "0 Hz detection signal output level (Hz)") :-
    b_getval(spec, S),
    c026(_,"ZS (0 Hz detection signal)"),
    F #= S.get(outputs/relay/zero_speed_detection_level),
    !.
c063(0.00, default).

c064(T, "Cooling fin overheat warning signal output level (°C)") :-
    b_getval(spec, S),
    c021(_,"OHF (Cooling fin overheat warning)"),
    T #= S.get(outputs/p1/cooling_fin_overheat_warning_level),
    !.
c064(T, "Cooling fin overheat warning signal output level (°C)") :-
    b_getval(spec, S),
    c022(_,"OHF (Cooling fin overheat warning)"),
    T #= S.get(outputs/p2/cooling_fin_overheat_warning_level),
    !.
c064(T, "Cooling fin overheat warning signal output level (°C)") :-
    b_getval(spec, S),
    c026(_,"OHF (Cooling fin overheat warning)"),
    T #= S.get(outputs/relay/cooling_fin_overheat_warning_level),
    !.

c064(100, default).

c071(05, default).
c072(1, default).
c074(00, default).
c075(1, default).
c076(02, default).
c077(0.00, default).
c078(0, default).

c081(100.0, default).
c082(100.0, default).
c085(100.0, default).
c091(00, default).

c096(00, default).
c098(1, default).
c099(1, default).
c100(00, default).

c101(00, default).
c102(02, default).
c103(00, default).
c104(00, default).
c105(100, default).
c106(100, default).
c109(0, default).
c111([], default).

c130(0.0, default).
c131(0.0, default).
c132(0.0, default).
c133(0.0, default).
c140(0.0, default).
c141(0.0, default).
c142(00, default).
c143(00, default).
c144(00, default).
c145(00, default).
c146(00, default).
c147(00, default).
c148(00, default).
c149(00, default).
c150(00, default).
c160(1, default).
c161(1, default).
c162(1, default).
c163(1, default).
c164(1, default).
c165(1, default).
c166(1, default).
c169(0, default).
