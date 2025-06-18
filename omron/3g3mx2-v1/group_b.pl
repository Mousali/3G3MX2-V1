% Group b: Detailed Function Parameters

%% Momentary power interruption/Trip restart
b001(00, "Trip"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_Restart),"trip"),
    !.
b001(01, "0-Hz restart"):-  
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_Restart),"0-Hz restart"),
    !.      
b001(02, "Frequency matching restart"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_Restart),"frequency matching restart"),
    !.
b001(03, "Trip after frequency matching deceleration stop"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_Restart),"trip after frequency matching deceleration stop"),
    !.
b001(04, "Frequency pull-in restart"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_Restart),"frequency pull-in restart"),
    !.
b001(00, default).

b002(T, "Allowable Power Interruption Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(power_interruption/allowable_power_interruption_time),
    T #>= 0.3, 
    T #=< 25.0,
    !.
b002(1.0, default).

b003(T, "Restart Standby Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(power_interruption/restart_standby_time),
    T #>= 0.3, 
    T #=< 100.0,
    !.
b003(1.0, default).

b004(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_trip_selection_during_stop),"disabled"),
    !.
b004(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_trip_selection_during_stop),"enabled"),
    !.  
b004(02, "Disabled during stop and deceleration stop by turning off the RUN command"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/undervoltage_trip_selection_during_stop),"disabled during stop and deceleration stop by turning off the RUN command"),
    !.
b004(00, default).

b005(00, "16 times"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/restart_count),"16 times"),
    !.
b005(01, "No limit"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/restart_count),"no limit"),
    !.
b005(00, default).

b007(F, "Frequency Matching Lower Limit Frequency (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(power_interruption/frequency_matching_lower_limit_frequency),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    F #>= 0.00, 
    F #=< 400.0,
    !.
b007(F, "Frequency Matching Lower Limit Frequency (Hz) High-Frequency Mode"):-
    b_getval(spec, S),
    F #= S.get(power_interruption/frequency_matching_lower_limit_frequency),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    F #>= 100.0, 
    F #=< 580.0,
    !.
b007(0.00, default).

b008(00, "Trip"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/overvoltage_overcurrent_restart_selection),"trip"),
    !.
b008(01, "0-Hz restart"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/overvoltage_overcurrent_restart_selection),"0-Hz restart"),
    !.
b008(02, "Frequency matching restart"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/overvoltage_overcurrent_restart_selection),"frequency matching restart"),
    !.
b008(03, "Trip after frequency matching deceleration stop"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/overvoltage_overcurrent_restart_selection),"trip after frequency matching deceleration stop"),
    !.
b008(04, "Frequency pull-in restart"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(power_interruption/overvoltage_overcurrent_restart_selection),"frequency pull-in restart"),
    !.
b008(00, default).

b010(T, "Overvoltage/Overcurrent Restart Count"):- 
    b_getval(spec, S),
    T #= S.get(power_interruption/overvoltage_overcurrent_restart_count),
    T #>= 1, 
    T #=< 3,
    !.
b010(3, default).

b011(T, "Overvoltage/Overcurrent Restart Standby Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(power_interruption/overvoltage_overcurrent_restart_standby_time),
    T #>= 0.3, 
    T #=< 100.0,
    !.
b011(1.0, default).

%% Electronic thermal
b012(Ti, "1st Electronic Thermal Level (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(electronic_thermal/first_level),
    rated_current(RatedCurrent),
    Ti #>= 0.20 * RatedCurrent, 
    Ti #=< 1.00 * RatedCurrent,
    !.
b012([], default).

b212(Ti,"2nd Electronic Thermal Level (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(electronic_thermal/second_level),
    rated_current(RatedCurrent),
    Ti #>= 0.20 * RatedCurrent, 
    Ti #=< 1.00 * RatedCurrent,
    !.
b212([], default).

b013(00, "Reduced torque characteristics"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/first_characteristics_selection),"reduced torque characteristics"),
    !.
b013(01, "Constant torque characteristics"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/first_characteristics_selection),"constant torque characteristics"),
    !.
b013(02, "Free setting"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/first_characteristics_selection),"free setting"),
    !.
b013(01, default).

b213(00, "Reduced torque characteristics"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/second_characteristics_selection),"reduced torque characteristics"),
    !.
b213(01, "Constant torque characteristics"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/second_characteristics_selection),"constant torque characteristics"),
    !.
b213(02, "Free setting"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/second_characteristics_selection),"free setting"),
    !.
b213(01, default).

b015(F, "Free Electronic Thermal Speed 1 (RPM)"):- 
    b_getval(spec, S),
    Rpm #= S.get(electronic_thermal/free_electronic_thermal_speed_1),
    F #= Rpm * S.get(motor/'1st'/poles) // 120,
    F #>= 0.00, 
    F #=< S.get(electronic_thermal/free_electronic_thermal_speed_2) * S.get(motor/'1st'/poles) // 120,
    !.
b015(0, default).

b016(Ti, "Free Electronic Thermal Current 1 (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(electronic_thermal/free_electronic_thermal_current_1),
    rated_current(RatedCurrent),
    Ti #>= 0.00, 
    Ti #=< RatedCurrent,
    !.
b016(0.00, default).

b017(F, "Free Electronic Thermal Speed 2 (RPM)"):- 
    b_getval(spec, S),
    Rpm #= S.get(electronic_thermal/free_electronic_thermal_speed_2),
    F #= Rpm * S.get(motor/'1st'/poles) // 120,
    F #>= S.get(electronic_thermal/free_electronic_thermal_speed_1) * S.get(motor/'1st'/poles) // 120, 
    F #=< S.get(electronic_thermal/free_electronic_thermal_speed_3) * S.get(motor/'1st'/poles) // 120,
    !.
b017(0, default).

b018(Ti, "Free Electronic Thermal Current 2 (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(electronic_thermal/free_electronic_thermal_current_2),
    rated_current(RatedCurrent),
    Ti #>= 0.00, 
    Ti #=< RatedCurrent,
    !.
b018(0.00, default).

b019(F, "Free Electronic Thermal Speed 3 (RPM)"):- 
    b_getval(spec, S),
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    Rpm #= S.get(electronic_thermal/free_electronic_thermal_speed_3),
    F #= Rpm * S.get(motor/'1st'/poles) // 120,
    F #>= S.get(electronic_thermal/free_electronic_thermal_speed_2) * S.get(motor/'1st'/poles) // 120, 
    F #=< 400,
    !.
b019(F, "Free Electronic Thermal Speed 3 (RPM) High-Frequency Mode"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    Rpm #= S.get(electronic_thermal/free_electronic_thermal_speed_3),
    F #= Rpm * S.get(motor/'1st'/poles) // 120,
    F #>= S.get(electronic_thermal/free_electronic_thermal_speed_2) * S.get(motor/'1st'/poles) // 120, 
    F #=< 580,
    !.
b019(0, default).

b020(Ti, "Free Electronic Thermal Current 3 (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(electronic_thermal/free_electronic_thermal_current_3),
    rated_current(RatedCurrent),
    Ti #>= 0.00, 
    Ti #=< RatedCurrent,
    !.
b020(0.00, default).

%% Overload limit, over current protection
b021(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"disabled"),
    !.
b021(01, "Enabled during acceleration and constant speed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"enabled during acceleration and constant speed"),
    !.
b021(02, "Enabled during constant speed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"enabled during constant speed"),
    !.
b021(03, "Enabled during acceleration and constant speed (Accelerated during regeneration)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"enabled during acceleration and constant speed (accelerated during regeneration)"),
    !.
b021(01, default).

b221(00, "disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"disabled"),
    !.
b221(01, "enabled during acceleration and constant speed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"enabled during acceleration and constant speed"),
    !.  
b221(02, "enabled during constant speed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"enabled during constant speed"),
    !.
b221(03, "enabled during acceleration and constant speed (accelerated during regeneration)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overload_limit_settings),"enabled during acceleration and constant speed (accelerated during regeneration)"),
    !.
b221(01, default).

b022 1st Overload Limit  Level 
b222 2nd Overload Limit  Level

values:
0.20 × Rated current to 2.00 × Rated current (Heavy load)
0.20 × Rated current to 1.50 × Rated current (Light load)


b022(Ti, "1st Overload Limit Level (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(overload_limit_overcurrent_protection/first_overload_limit_level),
    rated_current(RatedCurrent),
    Ti #>= 0.20 * RatedCurrent, 
    Ti #=< 2.00 * RatedCurrent,
    !.
b022([], default).

b222(Ti, "2nd Overload Limit Level (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(overload_limit_overcurrent_protection/second_overload_limit_level),
    rated_current(RatedCurrent),
    Ti #>= 0.20 * RatedCurrent, 
    Ti #=< 1.50 * RatedCurrent,
    !.
b222([], default).

b023(T, "1st Overload Limit Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(overload_limit_overcurrent_protection/first_overload_limit_time),
    T #>= 0.1, 
    T #=< 3000.0,
    !.
b023(1.0, default).
b223(T, "2nd Overload Limit Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(overload_limit_overcurrent_protection/second_overload_limit_time),
    T #>= 0.1, 
    T #=< 3000.0,
    !.
b223(1.0, default).

b024(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"disabled"),
    !.
b024(01, "Enabled during acceleration and constant speed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"enabled during acceleration and constant speed"),
    !.
b024(02, "Enabled during constant speed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"enabled during constant speed"),
    !.
b024(03, "Enabled during acceleration and constant speed (Accelerated during regeneration)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"enabled during acceleration and constant speed (accelerated during regeneration)"),
    !.
b024(01, default).

b025(Ti, "1st Overload Limit Level 2 (A)"):- 
    b_getval(spec, S),
    Ti #= S.get(overload_limit_overcurrent_protection/first_overload_limit_level_2),
    rated_current(RatedCurrent),
    Ti #>= 0.20 * RatedCurrent, 
    Ti #=< 2.00 * RatedCurrent,
    !.
b025([], default).

b026(T, "1st Overload Limit Time 2 (s)"):- 
    b_getval(spec, S),
    T #= S.get(overload_limit_overcurrent_protection/first_overload_limit_time_2),
    T #>= 0.1, 
    T #=< 3000.0,
    !.
b026(1.0, default).

b027(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"disabled"),
    !.
b027(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"enabled"),
    !.
b027(02, "Enabled (at reduced voltage startup)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/overcurrent_suppression_selection),"enabled (at reduced voltage startup)"),
    !.
b027(01, default).

b0028(T, "Frequency Pull-in Restart Level (A)"):- 
    b_getval(spec, S),
    T #= S.get(overload_limit_overcurrent_protection/frequency_pull_in_restart_level),
    rated_current(RatedCurrent),
    T #>= 0.20 * RatedCurrent, 
    T #=< 2.00 * RatedCurrent,
    !.
b028([], default).

b029(T, "Frequency Pull-in Restart Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(overload_limit_overcurrent_protection/frequency_pull_in_restart_time),
    T #>= 0.1, 
    T #=< 3000.0,
    !.
b029(0.5, default).

Starting Frequency  Selection at  Frequency Pull-in  Restart
00: Frequency at interruption
01: Maximum frequency
02: Set frequency (Frequency  reference)

b030(00, "Frequency at interruption"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/frequency_pull_in_restart_starting_frequency_selection),"frequency at interruption"),
    !.
b030(01, "Maximum frequency"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/frequency_pull_in_restart_starting_frequency_selection),"maximum frequency"),
    !.
b030(02, "Set frequency (Frequency reference)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(overload_limit_overcurrent_protection/frequency_pull_in_restart_starting_frequency_selection),"set frequency (frequency reference)"),
    !.
b030(00, default).

%% Lock
b031(00, "Data other than b031 cannot be changed when terminal SFT is ON"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(lock/soft_lock_selection),"data other than b031 cannot be changed when terminal SFT is ON"),
    !.
b031(01, "Data other than b031 and the set frequency cannot be changed when terminal SFT is ON"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(lock/soft_lock_selection),"data other than b031 and the set frequency cannot be changed when terminal SFT is ON"),
    !.
b031(02, "Data other than b031 cannot be changed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(lock/soft_lock_selection),"data other than b031 cannot be changed"),
    !.  
b031(03, "Data other than b031 and specified frequency parameter can not be changed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(lock/soft_lock_selection),"data other than b031 and specified frequency parameter can not be changed"),
    !.
b031(10, "Data can be changed during RUN"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(lock/soft_lock_selection),"data can be changed during RUN"),
    !.
b031(01, default).

%% Auxiliary function
b033(L, "Motor Cable Length (m)"):- 
    b_getval(spec, S),
    L #= S.get(motor/'1st'/motor_cable_length),
    L #>= 5, 
    L #=< 20,
    !.
b033(L, "Motor Cable Length (m)"):- 
    b_getval(spec, S),
    L #= S.get(motor/'2nd'/motor_cable_length),
    L #>= 5, 
    L #=< 20,
    !.
b033(10, default).

b034(T, "RUN Time/Power ON Time Detection Level (h)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/running_time_power_on_time_detection_level),
    T #>= 1, 
    T #=< 9999,
    !.
b034(0, default).

b035(00, "No direction limit"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/running_direction_limit_selection),"no direction limit"),
    !.
b035(01, "Only Forward is enabled (Reverse is limited)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/running_direction_limit_selection),"only forward is enabled (reverse is limited)"),
    !.
b035(02, "Only Reverse is enabled (Forward is limited)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/running_direction_limit_selection),"only reverse is enabled (forward is limited)"),
    !.
b035(00, default).

b036(T, "Reduced Voltage Startup Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/reduced_voltage_startup_selection),
    T #>= 1, 
    T #=< 255,
    !.
b036(2, default).

b037(00, "Complete display"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/display_selection),"complete display"),
    !.
b037(01, "Individual display of functions"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/display_selection),"individual display of functions"),
    !.
b037(02, "User setting + d001, F001, b037"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/display_selection),"user setting + d001, F001, b037"),
    !.
b037(03, "Data comparison display"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/display_selection),"data comparison display"),
    !.
b037(04, "Basic display"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/display_selection),"basic display"),
    !.
b037(05, "Monitor display + b037"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/display_selection),"monitor display + b037"),
    !.
b037(00, default).

%% Initial screen selection
b038(000, "Screen on which the Enter key was last pressed"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"screen on which the Enter key was last pressed"),
    !.
b038(001, "d001: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d001: output frequency monitor"),
    !.
b038(002, "d002: Output Current Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d002: output current monitor"),
    !.
b038(003, "d003: RUN Direction Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d003: run direction monitor"),
    !.
b038(004, "d004: PID Feedback Value Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d004: pid feedback value monitor"),
    !.
b038(005, "d005: Multi-function Input Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d005: multi-function input monitor"),
    !.
b038(006, "d006: Multi-function Output Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d006: multi-function output monitor"),
    !.
b038(007, "d007: Output Frequency Monitor (After Conversion)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d007: output frequency monitor (after conversion)"),
    !.
b038(008, "d008: Real Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d008: real frequency monitor"),
    !.
b038(009, "d009: Torque Reference Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d009: torque reference monitor"),
    !.
b038(010, "d010: Torque Bias Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d010: torque bias monitor"),
    !.
b038(012, "d012: Output Torque Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d012: output torque monitor"),
    !.
b038(013, "d013: Output Voltage Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d013: output voltage monitor"),
    !.
b038(014, "d014: Input Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d014: input power monitor"),
    !.
b038(015, "d015: Integrated Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d015: integrated power monitor"),
    !.
b038(016, "d016: Total RUN Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d016: total run time monitor"),
    !.
b038(017, "d017: Total Power ON Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d017: total power on time monitor"),
    !.
b038(018, "d018: Fin Temperature Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d018: fin temperature monitor"),
    !.
b038(022, "d022: Life Assessment Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d022: life assessment monitor"),
    !.
b038(023, "d023: Program Counter (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d023: program counter (driveprogramming)"),
    !.
b038(024, "d024: Program Number (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d024: program number (driveprogramming)"),
    !.
b038(025, "d025: User Monitor 0 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d025: user monitor 0 (driveprogramming)"),
    !.
b038(026, "d026: User Monitor 1 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d026: user monitor 1 (driveprogramming)"),
    !.
b038(027, "d027: User Monitor 2 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d027: user monitor 2 (driveprogramming)"),
    !.
b038(029, "d029: Position Command Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d029: position command monitor"),
    !.
b038(030, "d030: Current Position Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d030: current position monitor"),
    !.
b038(050, "d050: Dual User Monitor (2 types of data)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d050: dual user monitor (2 types of data)"),
    !.
b038(060, "d060: Inverter Mode Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_selection),"d060: inverter mode monitor"),
    !.
b038(001, default).

b039(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_parameter_automatic_setting_function),"disabled"),
    !.
b039(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_parameter_automatic_setting_function),"enabled"),
    !.
b039(00, default).

%% Torque limit
b040(00, "Four-quadrant separate setting"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_selection),"four-quadrant separate setting"),
    !.
b040(01, "Terminal switching"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_selection),"terminal switching"),
    !.
b040(02, "Analog voltage input"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_selection),"analog voltage input"),
    !.
b040(03, "Option (No applicable Option)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_selection),"option (no applicable option)"),
    !.
b040(00, default).

b041(T, "Torque Limit 1 (Four-quadrant Mode Forward Power Running) (%)"):- 
    b_getval(spec, S),
    T #= S.get(torque_limit/torque_limit_1),
    T #>= 0, 
    T #=< 200,
    !.
b041(255, "Torque Limit 1 Disabled"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_1),"disabled"),
    !.
b041(200, default).

b042(T, "Torque Limit 2 (Four-quadrant Mode Reverse Regeneration) (%)"):- 
    b_getval(spec, S),
    T #= S.get(torque_limit/torque_limit_2),
    T #>= 0, 
    T #=< 200,
    !.
b042(255, "Torque Limit 2 Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_2),"disabled"),
    !.
b042(200, default).

b043(T, "Torque Limit 3 (Four-quadrant Mode Reverse Power Running) (%)"):- 
    b_getval(spec, S),
    T #= S.get(torque_limit/torque_limit_3),
    T #>= 0, 
    T #=< 200,
    !.
b043(255, "Torque Limit 3 Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_3),"disabled"),
    !.
b043(200, default).

b044(T, "Torque Limit 4 (Four-quadrant Mode Forward Regeneration) (%)"):- 
    b_getval(spec, S),
    T #= S.get(torque_limit/torque_limit_4),
    T #>= 0, 
    T #=< 200,
    !.
b044(255, "Torque Limit 4 Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_limit_4),"disabled"),
    !.
b044(200, default).

b045(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_ladstop_selection),"disabled"),
    !.
b045(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/torque_ladstop_selection),"enabled"),
    !.
b045(00, default).

b046(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/reverse_rotation_prevention_selection),"disabled"),
    !.
b046(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(torque_limit/reverse_rotation_prevention_selection),"enabled"),
    !.
b046(00, default).

%% Mode
b049(00, "Heavy Load Mode (CT)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(mode/heavy_load_light_load_selection),"heavy load mode (ct)"),
    !.
b049(01, "Light Load Mode (VT)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(mode/heavy_load_light_load_selection),"light load mode (vt)"),
    !.
b049(00, default).

%% Deceleration Stop on Power Interruption
b050(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(deceleration_stop_on_power_interruption/deceleration_stop_on_power_interruption_selection),"disabled"),
    !.
b050(01, "Enabled (Deceleration stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(deceleration_stop_on_power_interruption/deceleration_stop_on_power_interruption_selection),"enabled (deceleration stop)"),
    !.
b050(02, "Enabled (Constant voltage, without recovery)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(deceleration_stop_on_power_interruption/deceleration_stop_on_power_interruption_selection),"enabled (constant voltage, without recovery)"),
    !.
b050(03, "Enabled (Constant voltage, with recovery)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(deceleration_stop_on_power_interruption/deceleration_stop_on_power_interruption_selection),"enabled (constant voltage, with recovery)"),
    !.
b050(00, default).

b051(V, "Starting Voltage on Power Interruption (V)"):-
    b_getval(spec, S),
    V #= S.get(deceleration_stop_on_power_interruption/starting_voltage_on_power_interruption),
    V #>= 0.0, 
    V #=< 1000,
    !.
b051([], default).

b052(V, "Deceleration Hold Level on Power Interruption (V)"):-
    b_getval(spec, S),
    V #= S.get(deceleration_stop_on_power_interruption/deceleration_hold_level_on_power_interruption),
    V #>= 0.0, 
    V #=< 1000,
    !.
b052([], default).

b053(T, "Deceleration Time on Power Interruption (s)"):-
    b_getval(spec, S),
    T #= S.get(deceleration_stop_on_power_interruption/deceleration_time_on_power_interruption),
    T #>= 0.01, 
    T #=< 3600,
    !.
b053(1.00, default).

b054(F, "Deceleration Starting Width on Power Interruption (Hz)"):-
    b_getval(spec, S),
    F #= S.get(deceleration_stop_on_power_interruption/deceleration_starting_width_on_power_interruption),
    F #>= 0.00, 
    F #=< 10.00,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.
b054(F, "Deceleration Starting Width on Power Interruption (high-frequency mode) (Hz)"):-
    b_getval(spec, S),
    F #= S.get(deceleration_stop_on_power_interruption/deceleration_starting_width_on_power_interruption),
    F #>= 0.00, 
    F #=< 100.0,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.    
b054(0.00, default).

%% Window comparator

b060(F, "Window Comparator FV Upper Limit Level (%)"):- 
    b_getval(spec, S),
    F #= S.get(window_comparator/window_comparator_fv_upper_limit_level),
    F #>= 0.0, 
    F #=< 100.0,
    !.
b060(100, default).

b061(F, "Window Comparator FV Lower Limit Level (%)"):- 
    b_getval(spec, S),
    F #= S.get(window_comparator/window_comparator_fv_lower_limit_level),
    F #>= 0.0, 
    F #=< 100.0,
    !.
b061(0, default).

b062(F, "Window Comparator FV Hysteresis Width (%)"):- 
    b_getval(spec, S),
    F #= S.get(window_comparator/window_comparator_fv_hysteresis_width),
    F #>= 0.0, 
    F #=< 10.0,
    !.
b062(0, default).

b063(F, "Window Comparator FI Upper Limit Level (%)"):- 
    b_getval(spec, S),
    F #= S.get(window_comparator/window_comparator_fi_upper_limit_level),
    F #>= 0.0, 
    F #=< 100.0,
    !.
b063(0, default).

b064(F, "Window Comparator FI Lower Limit Level (%)"):- 
    b_getval(spec, S),
    F #= S.get(window_comparator/window_comparator_fi_lower_limit_level),
    F #>= 0.0, 
    F #=< 100.0,
    !.
b064(100, default).

b065(F, "Window Comparator FI Hysteresis Width (%)"):- 
    b_getval(spec, S),
    F #= S.get(window_comparator/window_comparator_fi_hysteresis_width),
    F #>= 0.0, 
    F #=< 10.0,
    !.
b065(0, default).

b070(L, "Analog Operation Level at FV Disconnection"):- 
    b_getval(spec, S),
    L #= S.get(window_comparator/analog_operation_level_at_fv_disconnection),
    L #>= 0, 
    L #=< 100,
    !.
b070(255, "Analog Operation Disabled at FV Disconnection"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(window_comparator/analog_operation_level_at_fv_disconnection),"disabled"),
    !.
b070(255, default).

b071(L, "Analog Operation Level at FI Disconnection"):- 
    b_getval(spec, S),
    L #= S.get(window_comparator/analog_operation_level_at_fi_disconnection),
    L #>= 0, 
    L #=< 100,
    !.
b071(255, "Analog Operation Disabled at FI Disconnection"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(window_comparator/analog_operation_level_at_fi_disconnection),"disabled"),
    !.
b071(255, default).

%% Auxiliary function
b075(T, "Ambient Temperature (°C)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/ambient_temperature),
    T #>= -10, 
    T #=< 50,
    !.
b075(40, default).

b078(00, "Clear disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/integrated_power_clear),"clear disabled"),
    !.
b078(01, "Clear with Enter key"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/integrated_power_clear),"clear with enter key"),
    !.
b078(00, default).

b079(S, "Integrated Power Display Scale"):- 
    b_getval(spec, S),
    S #= S.get(auxiliary_function/integrated_power_display_scale),
    S #>= 1.0, 
    S #=< 1000.0,
    !.
b079(1, default).

b082(F, "Starting Frequency (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(auxiliary_function/starting_frequency),
    F #>= 0.01, 
    F #=< 9.99,
    \+ #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.
b082(F, "Starting Frequency (high-frequency mode) (Hz)"):-
    b_getval(spec, S),
    F #= S.get(auxiliary_function/starting_frequency),
    F #>= 0.01, 
    F #=< 100.0,
    #fuzzy_match_key_value(S.get(operations/inverter_mode),"Induction motor high-frequency"),
    !.
b082(1.50, default).

% TODO: see if checking for high-frequency mode is necessary
b083(F, "Carrier Frequency (kHz)"):- 
    b_getval(spec, S),
    F #= S.get(auxiliary_function/carrier_frequency),
    F #>= 2.0, 
    F #=< 15.0,
    \+ #fuzzy_match_key_value(S.get(mode/heavy_load_light_load_selection),"Light Load Mode (VT)"),
    !.
b083(F, "Carrier Frequency (Light Load Mode) (kHz)"):-
    b_getval(spec, S),
    F #= S.get(auxiliary_function/carrier_frequency),
    F #>= 2.0, 
    F #=< 10.0,
    #fuzzy_match_key_value(S.get(mode/heavy_load_light_load_selection),"Light Load Mode (VT)"),
    !.
b083(10.0, "Carrier Frequency (Heavy Load Mode) (kHz)"):-
    b_getval(spec, S),
    F #= S.get(auxiliary_function/carrier_frequency),
    F #>= 2.0, 
    F #=< 15.0,
    #fuzzy_match_key_value(S.get(mode/heavy_load_light_load_selection),"Heavy Load Mode (CT)"),
    !.
b083(2.0, "Carrier Frequency (Light Load Mode) (kHz)"):-
    b_getval(spec, S),
    F #= S.get(auxiliary_function/carrier_frequency),
    F #>= 2.0, 
    F #=< 10.0,
    #fuzzy_match_key_value(S.get(mode/heavy_load_light_load_selection),"Heavy Load Mode (CT)"),
    !.
b083(10.0, default).

b084(00, "Initialization Selection"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_selection),"disabled"),
    !.
b084(01, "Clearing Fault Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_selection),"clearing fault monitor"),
    !.
b084(02, "Initialize data"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_selection),"initialize data"),
    !.
b084(03, "Clear fault monitor + Initialize data"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_selection),"clear fault monitor + initialize data"),
    !.
b084(04, "Clear fault monitor + Initialize data + Clear DriveProgramming"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_selection),"clear fault monitor + initialize data + clear driveprogramming"),
    !.
b084(00, default).

b085(00, default).

b086(F, "Frequency Conversion Coefficient"):- 
    b_getval(spec, S),
    F #= S.get(auxiliary_function/frequency_conversion_coefficient),
    F #>= 0.01, 
    F #=< 99.99,
    !.
b086(1.00, default).

b087(00, "STOP Key Selection"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/stop_key_selection),"enabled"),
    !.
b087(01, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/stop_key_selection),"disabled"),
    !.
b087(02, "Only RESET enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/stop_key_selection),"only RESET enabled"),
    !.
b087(00, default).


b088(00, "Free-run Stop Selection (0-Hz restart)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/free_run_stop_selection),"0-hz restart"),
    !.
b088(01, "Free-run Stop Selection (Frequency matching restart)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/free_run_stop_selection),"frequency matching restart"),
    !.
b088(02, "Free-run Stop Selection (Frequency pull-in restart)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/free_run_stop_selection),"frequency pull-in restart"),
    !.
b088(00, default).

b089(00, "Automatic Carrier Reduction Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/automatic_carrier_reduction),"disabled"),
    !.
b089(01, "Automatic Carrier Reduction Enabled (based on current)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/automatic_carrier_reduction),"enabled (based on current)"),
    !.
b089(02, "Automatic Carrier Reduction Enabled (based on cooling fin temperature)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/automatic_carrier_reduction),"enabled (based on cooling fin temperature)"),
    !.
b089(01, default).
b090(0.0, default).
b091(00, default).
b092(01, default).
b093(00, default).
b094(00, default).
b095(00, default).
b096([], default).
b097([], default).

%% V/f free function
b100(0, default).
b101(0.0, default).
b102(0, default).
b103(0.0, default).
b104(0, default).
b105(0.0, default).
b106(0, default).
b107(0.0, default).
b108(0, default).
b109(0.0, default).
b110(0, default).
b111(0.0, default).
b112(0, default).
b113(0.0, default).

%brake control
b120(00, default).
b121(0.00, default).
b122(0.00, default).
b123(0.00, default).
b124(0.00, default).
b126([], default).
b127(0.00, default).

%% Over voltage suppression during deceleration
b130(01, default).
b131([], default).
b132(1.00, default).
b133(0.20, default).
b134(1.0, default).

%% Auxiliary function
b145(00, default).
b150(001, default).
b160(001, default).
b161(002, default).
b163(00, default).
b164(00, default).
b165(02, default).
b166(00, default).

%% Mode
b171(00, default).

%% Auxiliary function
b180(00, default).
b190(0000, default).
b191(0000, default).
b192(0000, default).
b193(0000, default).

%% Electronic thermal
b910(03, default).
b911(600.00, default).
b912(120.00, default).
b913(100.0, default).

group: Auxiliary function


Parameter b075: Ambient Temperature ​

Range: −10 to 50 °C ​
Default Data: 40 °C ​
Set Data: Adjustable
Description: Sets the ambient temperature in the operating environment of the inverter. ​



Parameter b078: Integrated Power Clear ​

Range: 00 (Clear disabled), 01 (Clear with Enter key)
Default Data: 00 ​
Set Data: Adjustable
Description: Clears the integrated power monitor data when enabled. ​



Parameter b079: Integrated Power Display Scale ​

Range: 1.0 to 1000.0 ​
Default Data: 1.0
Set Data: Adjustable
Description: Sets the scaling factor for the integrated power display. ​



Parameter b082: Starting Frequency ​

Range: 0.01 to 9.99 Hz (100.0 Hz in high-frequency mode)
Default Data: 1.50 Hz ​
Set Data: Adjustable
Description: Sets the frequency at which the inverter starts operation. ​



Parameter b083: Carrier Frequency ​

Range: 2.0 to 15.0 kHz (Heavy load mode), 2.0 to 10.0 kHz (Light load mode) ​
Default Data: 10.0 kHz (Heavy load mode), 2.0 kHz (Light load mode)
Set Data: Adjustable
Description: Sets the carrier frequency for the inverter. ​



Parameter b084: Initialization Selection ​

Range: 00 (Disabled), 01 (Clearing Fault Monitor), 02 (Initialize data), 03 (Clear fault monitor + Initialize data), 04 (Clear fault monitor + Initialize data + Clear DriveProgramming) ​
Default Data: 00 ​
Set Data: Adjustable
Description: Selects the type of initialization to perform on the inverter. ​



Parameter b085: Initialization Data Selection ​

Range: Fixed at 00
Default Data: 00 ​
Set Data: Fixed
Description: Reserved for initialization data selection. ​



Parameter b086: Frequency Conversion Coefficient ​

Range: 0.01 to 99.99 ​
Default Data: 1.00
Set Data: Adjustable
Description: Converts the output frequency value for monitoring purposes. ​



Parameter b087: STOP Key Selection ​

Range: 00 (Enabled), 01 (Disabled), 02 (Only RESET enabled)
Default Data: 00 ​
Set Data: Adjustable
Description: Configures the functionality of the STOP key on the Digital Operator. ​



Parameter b088: Free-run Stop Selection ​

Range: 00 (0-Hz restart), 01 (Frequency matching restart), 02 (Frequency pull-in restart) ​
Default Data: 00 ​
Set Data: Adjustable
Description: Configures the inverter's behavior during free-run stop. ​



Parameter b089: Automatic Carrier Reduction ​

Range: 00 (Disabled), 01 (Enabled based on current), 02 (Enabled based on cooling fin temperature) ​
Default Data: 01 ​
Set Data: Adjustable
Description: Enables automatic carrier frequency reduction based on current or cooling fin temperature. ​



Parameter b090: Usage Rate of Regenerative Braking ​

Range: 0.0 to 100.0 % ​
Default Data: 0.0 %
Set Data: Adjustable
Description: Sets the usage rate of regenerative braking. ​



Parameter b091: Stop Selection ​

Range: 00 (Deceleration stop), 01 (Free-run stop) ​
Default Data: 00 ​
Set Data: Adjustable
Description: Configures the stop method for the inverter. ​



Parameter b092: Cooling Fan Operation ​

Range: 00 (Always enabled), 01 (Enabled only during operation), 02 (Dependent on cooling fin temperature) ​
Default Data: 01 ​
Set Data: Adjustable
Description: Configures the cooling fan operation mode based on inverter status or temperature. ​



Parameter b093: Total Fan Operation Time Clear ​

Range: 00 (Clear disabled), 01 (Clear with Enter key)
Default Data: 00 ​
Set Data: Adjustable
Description: Clears the total fan operation time, typically done when replacing the cooling fan. ​



Parameter b097: Not specified in the provided document.



group: V/f free function
Parameters b100 to b113 are used to configure the Free V/f function, which allows adjustment of the inverter's output voltage and frequency characteristics at specific breakpoints. The parameters include frequency and voltage settings for up to seven breakpoints, enabling custom V/f characteristics for specialized motor control scenarios. ​


Frequency Parameters:

b100: Free V/f Frequency 1 ​
b102: Free V/f Frequency 2 ​
b104: Free V/f Frequency 3 ​
b106: Free V/f Frequency 4 ​
b108: Free V/f Frequency 5 ​
b110: Free V/f Frequency 6 ​
b112: Free V/f Frequency 7 ​



Voltage Parameters:

b101: Free V/f Voltage 1 ​
b103: Free V/f Voltage 2 ​
b105: Free V/f Voltage 3 ​
b107: Free V/f Voltage 4 ​
b109: Free V/f Voltage 5 ​
b111: Free V/f Voltage 6 ​
b113: Free V/f Voltage 7 ​



Notes:

Frequency values must be set in ascending order: f1 ≤ f2 ≤ f3 ≤ f4 ≤ f5 ≤ f6 ≤ f7. ​
Voltage values correspond to the respective frequency points. ​
The Free V/f function is disabled by default and can be enabled by setting the 1st/2nd Control Method (A044/A244) to 02 (Free V/f setting).
When enabled, torque boost, base frequency, and maximum frequency settings are disabled. ​
Frequency ranges are typically 0.0 to 400.0 Hz (580.0 Hz in high-frequency mode), and voltage ranges are 0.0 to 800.0 V.



group: Brake control
Parameters b120 to b127 are used to configure the Brake Control Function in the inverter, which is essential for managing external brakes in applications like elevators, cranes, or systems requiring precise braking control. ​ Below are the details of each parameter:


b120: Brake Control Function Selection ​

Range:

00: Disabled ​
01: Enabled (DC Injection Braking enabled during stop) ​
02: Enabled (DC Injection Braking disabled during stop) ​


Default Data: 00 ​
Description: Enables or disables the brake control function and specifies DC Injection Braking behavior during stop. ​



b121: Brake Release Wait Time ​

Range: 0.00 to 5.00 seconds
Default Data: 0.00 seconds ​
Description: Sets the time the inverter waits after reaching the Brake Release Frequency before outputting the brake release signal. ​



b122: Acceleration Wait Time on Brake Control ​

Range: 0.00 to 5.00 seconds
Default Data: 0.00 seconds ​
Description: Sets the mechanical delay time from when the brake release signal turns ON until the brake is fully released. ​



b123: Stop Wait Time on Brake Control ​

Range: 0.00 to 5.00 seconds
Default Data: 0.00 seconds ​
Description: Sets the mechanical delay time from when the brake release signal turns OFF until the brake is fully applied. ​



b124: Brake Error Detection Time ​

Range: 0.00 to 5.00 seconds
Default Data: 0.00 seconds ​
Description: Sets the time the inverter waits for the brake confirmation signal to turn ON after outputting the brake release signal. ​ If the signal does not turn ON within this time, the inverter detects a brake error. ​



b125: Brake Release Frequency ​

Range: 0.00 to 400.0 Hz ​
Default Data: 0.00 Hz ​
Description: Sets the frequency at which the brake release signal is output. ​



b126: Brake Release Current ​

Range: 0.00 to 2.00 × Rated current of inverter ​
Default Data: Rated current of inverter ​
Description: Sets the output current value sufficient to support the load and output the brake release signal. ​



b127: Brake Force Frequency ​

Range: 0.00 to 400.0 Hz
Default Data: 0.00 Hz ​
Description: Sets the frequency at which the brake release signal turns OFF and forces the brake during stop. ​



Notes:

Proper configuration of these parameters ensures smooth operation and prevents mechanical damage or load fall accidents. ​
It is recommended to use Sensorless Vector Control for high torque during startup. ​
Ensure the frequency set in b125 is higher than the Starting Frequency (b082) to avoid overload detection.



group: Overvoltage suppression during deceleration
Parameters b130 to b134 are used to configure the Overvoltage Suppression Function During Deceleration, which prevents overvoltage trips caused by regenerative energy during motor deceleration. Below are the details of each parameter:


b130: Overvoltage Suppression Function Selection During Deceleration ​

Range:

00: Disabled ​
01: Enabled (DC voltage kept constant) ​
02: Enabled (Acceleration enabled)


Default Data: 01 (Enabled: DC voltage kept constant) ​
Description: Enables or disables the overvoltage suppression function during deceleration. ​ When enabled, the inverter adjusts the deceleration rate or accelerates to suppress overvoltage. ​



b131: Overvoltage Suppression Level During Deceleration ​

Range:

200-V class: 330.0 to 395.0 V
400-V class: 660.0 to 790.0 V


Default Data:

200-V class: 380.0 V
400-V class: 760.0 V


Description: Sets the DC voltage level at which the overvoltage suppression function activates. Ensure this value is higher than the input voltage multiplied by √2 to avoid deceleration issues. ​



b132: Overvoltage Suppression Parameter During Deceleration ​

Range: 0.10 to 30.00 seconds
Default Data: 1.00 seconds
Description: Sets the acceleration rate or deceleration time for the output frequency when the overvoltage suppression function is enabled. ​ This determines how quickly the suppression function reacts.



b133: Overvoltage Suppression Proportional Gain During Deceleration ​

Range: 0.00 to 5.00 ​
Default Data: 0.20 ​
Description: Sets the proportional gain for DC voltage constant control. ​ Higher values result in faster suppression response but may increase the risk of overcurrent trips. ​



b134: Overvoltage Suppression Integral Time During Deceleration ​

Range: 0.0 to 150.0 seconds
Default Data: 1.0 seconds
Description: Sets the integral time for DC voltage constant control. ​ Lower values provide faster response but may increase the risk of overcurrent trips. ​



Notes:

Proper configuration of these parameters ensures smooth deceleration without overvoltage trips. ​
Adjust b133 and b134 carefully to balance suppression speed and stability. ​
If regenerative braking units or braking resistors are used, these settings may need adjustment to optimize performance. ​
For applications with high inertia loads, such as elevators or conveyors, these parameters are critical to prevent overvoltage errors caused by regenerative energy. ​

group: Auxiliary function

b145 GS Input Operation Selection
00: No trip (shut off by hardware)
01: Trip

b150 Inverter Display on Operator Connection
001 to 060 (Corresponding to d001 to d060)

b160 User Monitor Selection 1
001 to 030 (Corresponding to d001 to d030)

b161 User Monitor Selection 2
001 to 030 (Corresponding to d001 to d030)

b163 d001/d007 Data Setting Selection
00: Disabled
01: Enabled

b164 Initial Screen Automatic Return Function
00: Disabled
01: Enabled

b165 Operation Selection at External Operator Disconnection
00: Trip
01: Trip after deceleration stop
02: Ignore
03: Free-run stop
04: Deceleration stop

b166 (Reserved) Do not change the default 00




group: Mode
b171 Inverter Mode Selection
00: Selection disabled
01: Induction motor mode
02: Induction motor high-frequency mode
03: PM motor mode

group: Auxiliary function

b180 Initialization Execution
00: Function disabled
01: Execute initialization

b190 Password A Setting
0000: Function disabled
0001 to FFFF: Password

b191 Password A for Authentication 
0000 to FFFF

b192 Password B Setting
0000: Function disabled
0001 to FFFF: Password

b193 Password B for Authentication 
0000 to FFFF


group: Electronic thermal
b910 Motor Electronic Thermal Selection
00: Disabled
01: Enabled (Fixed subtraction ratio)
02: Enabled (b911 subtraction ratio)
03: Enabled (b912 time parameter subtraction)

b911 Motor Electronic Thermal Subtraction Ratio
0.10 to 100000.00
(Displays upper 4 digits)

b912 Motor Electronic Thermal Subtraction Time Constant
0.10 to 100000.00
(Displays upper 4 digits)

b913 Motor Electronic Thermal Integration Gain
1.0 to 200.0
