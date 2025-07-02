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

b090(R, "Usage Rate of Regenerative Braking (%)"):- 
    b_getval(spec, S),
    R #= S.get(auxiliary_function/usage_rate_of_regenerative_braking),
    R #>= 0.0, 
    R #=< 100.0,
    !.
b090(0.0, default).

b091(00, "Stop Selection (Deceleration stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/stop_selection),"deceleration stop"),
    !.
b091(01, "Stop Selection (Free-run stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/stop_selection),"free-run stop"),
    !.
b091(00, default).

b092(00, "Cooling Fan Operation Always Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/cooling_fan_operation),"always enabled"),
    !.
b092(01, "Cooling Fan Operation Enabled Only During Operation"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/cooling_fan_operation),"enabled only during operation"),
    !.
b092(02, "Cooling Fan Operation Dependent on Cooling Fin Temperature"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/cooling_fan_operation),"dependent on cooling fin temperature"),
    !.
b092(01, default).

b093(00, "Total Fan Operation Time Clear Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/total_fan_operation_time_clear),"clear disabled"),
    !.
b093(01, "Total Fan Operation Time Clear with Enter Key"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/total_fan_operation_time_clear),"clear with enter key"),
    !.
b093(00, default).

b094(00, "All data"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_target_setting),"all data"),
    !.
b094(01, "All data other than terminals/communications"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_target_setting),"all data other than terminals/communications"),
    !.
b094(02, "Only User Selection 1 to 32 (U001 to U032)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_target_setting),"only user selection 1 to 32 (u001 to u032)"),
    !.
b094(03, "Other than User Selection 1 to 32 (U001 to U032) and Display Selection (b037)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_target_setting),"other than user selection 1 to 32 (u001 to u032) and display selection (b037)"),
    !.
b094(00, default).

b095(00, "Disabled (Function not active)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/regenerative_braking_selection),"disabled (function not active)"),
    !.
b095(01, "Enabled (Disabled during stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/regenerative_braking_selection),"enabled (disabled during stop)"),
    !.
b095(02, "Enabled (Enabled during operation and stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/regenerative_braking_selection),"enabled (enabled during operation and stop)"),
    !.
b095(00, default).

b096(F, "Regenerative Braking ON Level (V)"):- 
    b_getval(spec, S),
    F #= S.get(auxiliary_function/regenerative_braking_on_level),
    F #>= 330, 
    F #=< 380,
    vdf_class('200V'),
    !.
b096(F, "Regenerative Braking ON Level (V)"):-
    b_getval(spec, S),
    F #= S.get(auxiliary_function/regenerative_braking_on_level),
    F #>= 660,
    F #=< 760,
    vdf_class('400V'),
    !.
b096([], default).

b097(R, "Braking Resistor Value (Ω)"):- 
    b_getval(spec, S),
    R #= S.get(auxiliary_function/minimum_braking_resistor_value),
    R #=< 600.0,
    !.
b097([], default).

%% V/f free function
b100(F, "Free V/f Frequency 1 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_1),
    F #>= 0.0, 
    F #=< S.get(vf_free/free_vf_frequency_2),
    !.
b100(0, default).
b101(V, "Free V/f Voltage 1 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_1),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b101(0.0, default).
b102(F, "Free V/f Frequency 2 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_2),
    F #>= S.get(vf_free/free_vf_frequency_1), 
    F #=< S.get(vf_free/free_vf_frequency_3),
    !.
b102(0, default).
b103(V, "Free V/f Voltage 2 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_2),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b103(0.0, default).
b104(F, "Free V/f Frequency 3 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_3),
    F #>= S.get(vf_free/free_vf_frequency_2), 
    F #=< S.get(vf_free/free_vf_frequency_4),
    !.
b104(0, default).
b105(V, "Free V/f Voltage 3 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_3),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b105(0.0, default).
b106(F, "Free V/f Frequency 4 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_4),
    F #>= S.get(vf_free/free_vf_frequency_3), 
    F #=< S.get(vf_free/free_vf_frequency_5),
    !.
b106(0, default).
b107(V, "Free V/f Voltage 4 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_4),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b107(0.0, default).
b108(F, "Free V/f Frequency 5 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_5),
    F #>= S.get(vf_free/free_vf_frequency_4), 
    F #=< S.get(vf_free/free_vf_frequency_6),
    !.
b108(0, default).
b109(V, "Free V/f Voltage 5 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_5),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b109(0.0, default).
b110(F, "Free V/f Frequency 6 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_6),
    F #>= S.get(vf_free/free_vf_frequency_5), 
    F #=< S.get(vf_free/free_vf_frequency_7),
    !.
b110(0, default).
b111(V, "Free V/f Voltage 6 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_6),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b111(0.0, default).
b112(F, "Free V/f Frequency 7 (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(vf_free/free_vf_frequency_7),
    F #>= S.get(vf_free/free_vf_frequency_6), 
    F #=< 400.0,
    !.
b112(0, default).
b113(V, "Free V/f Voltage 7 (V)"):- 
    b_getval(spec, S),
    V #= S.get(vf_free/free_vf_voltage_7),
    V #>= 0.0, 
    V #=< 800.0,
    !.
b113(0.0, default).

%brake control
b120(00, "Brake Control Function Selection (Disabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/brake_control_function_selection),"disabled"),
    !.
b120(01, "Brake Control Function Selection (Enabled, DC Injection Braking enabled during stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/brake_control_function_selection),"enabled (dc injection braking enabled during stop)"),
    !.
b120(02, "Brake Control Function Selection (Enabled, DC Injection Braking disabled during stop)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/brake_control_function_selection),"enabled (dc injection braking disabled during stop)"),
    !.
b120(00, default).

b121(T, "Brake Release Wait Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/brake_release_wait_time),
    T #>= 0.00, 
    T #=< 5.00,
    !.
b121(0.00, default).

b122(T, "Acceleration Wait Time on Brake Control (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/acceleration_wait_time_on_brake_control),
    T #>= 0.00, 
    T #=< 5.00,
    !.
b122(0.00, default).

b123(T, "Stop Wait Time on Brake Control (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/stop_wait_time_on_brake_control),
    T #>= 0.00, 
    T #=< 5.00,
    !.
b123(0.00, default).

b124(T, "Brake Error Detection Time (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/brake_error_detection_time),
    T #>= 0.00, 
    T #=< 5.00,
    !.
b124(0.00, default).

b125(F, "Brake Release Frequency (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(auxiliary_function/brake_release_frequency),
    F #>= 0.00, 
    F #=< 400.0,
    !.
b125(00, default).

b126(I, "Brake Release Current (A)"):- 
    b_getval(spec, S),
    I #= S.get(auxiliary_function/brake_release_current),
    I #>= 0.00, 
    I #=< S.get(operations/inverter_rated_current),
    !.
b126([], default).

b127(F, "Brake Force Frequency (Hz)"):- 
    b_getval(spec, S),
    F #= S.get(auxiliary_function/brake_force_frequency),
    F #>= 0.00, 
    F #=< 400.0,
    !.
b127(0.00, default).

%% Over voltage suppression during deceleration
b130(00, "Overvoltage Suppression Function Selection During Deceleration (Disabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/overvoltage_suppression_function_selection_during_deceleration),"disabled"),
    !.
b130(01, "Overvoltage Suppression Function Selection During Deceleration (Enabled, DC voltage kept constant)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/overvoltage_suppression_function_selection_during_deceleration),"enabled (dc voltage kept constant)"),
    !.
b130(02, "Overvoltage Suppression Function Selection During Deceleration (Enabled, Acceleration enabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/overvoltage_suppression_function_selection_during_deceleration),"enabled (acceleration enabled)"),
    !.
b130(01, default).
b131(V, "Overvoltage Suppression Level During Deceleration (V)"):- 
    b_getval(spec, S),
    V #= S.get(auxiliary_function/overvoltage_suppression_level_during_deceleration),
    vdf_class('200V'),
    V #>= 330.0, 
    V #=< 395.0,
    !.
b131(V, "Overvoltage Suppression Level During Deceleration (V)"):-
    b_getval(spec, S),
    V #= S.get(auxiliary_function/overvoltage_suppression_level_during_deceleration),
    vdf_class('400V'),
    V #>= 660.0, 
    V #=< 790.0,
    !.
b131(380, default):-
    vdf_class('200V'),
    !.
b131(760, default):-
    vdf_class('400V'),
    !.

b132(T, "Overvoltage Protection Parameter During Deceleration (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/overvoltage_protection_parameter_during_deceleration),
    T #>= 0.10, 
    T #=< 30.00,
    !.
b132(1.00, default).

b133(G, "Overvoltage Suppression Proportional Gain During Deceleration"):- 
    b_getval(spec, S),
    G #= S.get(auxiliary_function/overvoltage_suppression_proportional_gain_during_deceleration),
    G #>= 0.00, 
    G #=< 5.00,
    !.
b133(0.20, default).

b134(T, "Overvoltage Suppression Integral Time During Deceleration (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/overvoltage_suppression_integral_time_during_deceleration),
    T #>= 0.0, 
    T #=< 150.0,
    !.
b134(1.0, default).

%% Auxiliary function
b145(00, "No trip"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/gs_input_operation_selection),"no trip"),
    !.
b145(01, "Trip"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/gs_input_operation_selection),"trip"),
    !.
b145(00, default).
b150(001, "d001: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d001: output frequency monitor"),
    !.
b150(002, "d002: Output Current Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d002: output current monitor"),
    !.
b150(003, "d003: RUN Direction Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d003: run direction monitor"),
    !.
b150(004, "d004: PID feedback monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d004: pid feedback monitor"),
    !.
b150(005, "d005: Multi-function Input Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d005: multi-function input monitor"),
    !.
b150(006, "d006: Multi-function Output Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d006: multi-function output monitor"),
    !.
b150(007, "d007: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d007: output frequency monitor"),
    !.
b150(008, "d008: Real Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d008: real frequency monitor"),
    !.
b150(009, "d009: Torque Reference Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d009: torque reference monitor"),
    !.
b150(010, "d010: Torque Bias Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d010: torque bias monitor"),
    !.
b150(012, "d012: Output Torque Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d012: output torque monitor"),
    !.
b150(013, "d013: Output Voltage Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d013: output voltage monitor"),
    !.
b150(014, "d014: Input Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d014: input power monitor"),
    !.
b150(015, "d015: Integrated Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d015: integrated power monitor"),
    !.
b150(016, "d016: Total RUN Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d016: total run time monitor"),
    !.
b150(017, "d017: Total Power ON Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d017: total power on time monitor"),
    !.
b150(018, "d018: Fin Temperature Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d018: fin temperature monitor"),
    !.
b150(022, "d022: Life Assessment Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d022: life assessment monitor"),
    !.
b150(023, "d023: Program Counter (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d023: program counter (driveprogramming)"),
    !.
b150(024, "d024: Program Number Monitor (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d024: program number monitor (driveprogramming)"),
    !.
b150(025, "d025: User Monitor 0 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d025: user monitor 0 (driveprogramming)"),
    !.
b150(026, "d026: User Monitor 1 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d026: user monitor 1 (driveprogramming)"),
    !.
b150(027, "d027: User Monitor 2 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d027: user monitor 2 (driveprogramming)"),
    !.
b150(029, "d029: Position Command Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d029: position command monitor"),
    !.
b150(030, "d030: Current Position Monitor"):-   
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"d030: current position monitor"),
    !.
b150(050, "Dual User Monitor (2 types of data)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"dual user monitor (2 types of data)"),
    !.
b150(060, "Inverter Mode Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/inverter_display_on_operator_connection),"inverter mode monitor"),
    !.
b150(001, default).

b160(001, "d001: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d001: output frequency monitor"),
    !.
b160(002, "d002: Output Current Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d002: output current monitor"),
    !.
b160(003, "d003: RUN Direction Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d003: run direction monitor"),
    !.
b160(004, "d004: PID feedback monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d004: pid feedback monitor"),
    !.
b160(005, "d005: Multi-function Input Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d005: multi-function input monitor"),
    !.
b160(006, "d006: Multi-function Output Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d006: multi-function output monitor"),
    !.
b160(007, "d007: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d007: output frequency monitor"),
    !.
b160(008, "d008: Real Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d008: real frequency monitor"),
    !.
b160(009, "d009: Torque Reference Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d009: torque reference monitor"),
    !.
b160(010, "d010: Torque Bias Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d010: torque bias monitor"),
    !.
b160(012, "d012: Output Torque Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d012: output torque monitor"),
    !.
b160(013, "d013: Output Voltage Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d013: output voltage monitor"),
    !.
b160(014, "d014: Input Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d014: input power monitor"),
    !.
b160(015, "d015: Integrated Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d015: integrated power monitor"),
    !.
b160(016, "d016: Total RUN Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d016: total run time monitor"),
    !.
b160(017, "d017: Total Power ON Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d017: total power on time monitor"),
    !.
b160(018, "d018: Fin Temperature Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d018: fin temperature monitor"),
    !.
b160(022, "d022: Life Assessment Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d022: life assessment monitor"),
    !.
b160(023, "d023: Program Counter (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d023: program counter (driveprogramming)"),
    !.
b160(024, "d024: Program Number Monitor (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d024: program number monitor (driveprogramming)"),
    !.
b160(025, "d025: User Monitor 0 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d025: user monitor 0 (driveprogramming)"),
    !.
b160(026, "d026: User Monitor 1 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d026: user monitor 1 (driveprogramming)"),
    !.
b160(027, "d027: User Monitor 2 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d027: user monitor 2 (driveprogramming)"),
    !.
b160(029, "d029: Position Command Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d029: position command monitor"),
    !.
b160(030, "d030: Current Position Monitor"):-   
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_1),"d030: current position monitor"),
    !.
b160(001, default).

b161(001, "d001: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d001: output frequency monitor"),
    !.
b161(002, "d002: Output Current Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d002: output current monitor"),
    !.
b161(003, "d003: RUN Direction Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d003: run direction monitor"),
    !.
b161(004, "d004: PID feedback monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d004: pid feedback monitor"),
    !.
b161(005, "d005: Multi-function Input Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d005: multi-function input monitor"),
    !.
b161(006, "d006: Multi-function Output Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d006: multi-function output monitor"),
    !.
b161(007, "d007: Output Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d007: output frequency monitor"),
    !.
b161(008, "d008: Real Frequency Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d008: real frequency monitor"),
    !.
b161(009, "d009: Torque Reference Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d009: torque reference monitor"),
    !.
b161(010, "d010: Torque Bias Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d010: torque bias monitor"),
    !.
b161(012, "d012: Output Torque Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d012: output torque monitor"),
    !.
b161(013, "d013: Output Voltage Monitor"):- 
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d013: output voltage monitor"),
    !.
b161(014, "d014: Input Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d014: input power monitor"),
    !.
b161(015, "d015: Integrated Power Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d015: integrated power monitor"),
    !.
b161(016, "d016: Total RUN Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d016: total run time monitor"),
    !.
b161(017, "d017: Total Power ON Time Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d017: total power on time monitor"),
    !.
b161(018, "d018: Fin Temperature Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d018: fin temperature monitor"),
    !.
b161(022, "d022: Life Assessment Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d022: life assessment monitor"),
    !.
b161(023, "d023: Program Counter (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d023: program counter (driveprogramming)"),
    !.
b161(024, "d024: Program Number Monitor (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d024: program number monitor (driveprogramming)"),
    !.
b161(025, "d025: User Monitor 0 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d025: user monitor 0 (driveprogramming)"),
    !.
b161(026, "d026: User Monitor 1 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d026: user monitor 1 (driveprogramming)"),
    !.
b161(027, "d027: User Monitor 2 (DriveProgramming)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d027: user monitor 2 (driveprogramming)"),
    !.
b161(029, "d029: Position Command Monitor"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d029: position command monitor"),
    !.
b161(030, "d030: Current Position Monitor"):-   
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/user_monitor_selection_2),"d030: current position monitor"),
    !.
b161(002, default).
b163(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/d001_d007_data_setting_selection),"disabled"),
    !.
b163(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/d001_d007_data_setting_selection),"enabled"),
    !.
b163(00, default).
b164(00, "Disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_automatic_return_function),"disabled"),
    !.
b164(01, "Enabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initial_screen_automatic_return_function),"enabled"),
    !.
b164(00, default).
b165(00, "Trip"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/operation_selection_at_external_operator_disconnection),"trip"),
    !.
b165(01, "Trip after deceleration stop"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/operation_selection_at_external_operator_disconnection),"trip after deceleration stop"),
    !.
b165(02, "Ignore"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/operation_selection_at_external_operator_disconnection),"ignore"),
    !.
b165(03, "Free-run stop"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/operation_selection_at_external_operator_disconnection),"free-run stop"),
    !.
b165(04, "Deceleration stop"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/operation_selection_at_external_operator_disconnection),"deceleration stop"),
    !.
b165(02, default).

b166(00, default).

%% Mode
b170(00, "Selection disabled"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter_mode),"selection disabled"),
    !.
b170(01, "Induction motor mode"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter_mode),"induction motor mode"),
    !.
b170(02, "Induction motor high-frequency mode"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter_mode),"induction motor high-frequency mode"),
    !.
b170(03, "PM motor mode"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(inverter_mode),"pm motor mode"),
    !.
b171(00, default).

%% Auxiliary function

b180(00, "Initialization Execution (Disabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_execution),"disabled"),
    !.
b180(01, "Initialization Execution (Enabled, Function 1)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/initialization_execution),"enabled"),
    !.
b180(00, default).
b190(0000, "Password A Setting (Disabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/password_a_setting),"disabled"),
    !.
b190(Password,"Password A Setting"):-
    b_getval(spec, S),
    Password = S.get(auxiliary_function/password_a),
    Password >= 0001, 
    Password =< 'FFFF',
    !.
b190(0000, default).
b191(Password, "Password A for Authentication"):- 
    b_getval(spec, S),
    Password = S.get(auxiliary_function/password_a_for_authentication),
    Password >= 0000, 
    Password =< 'FFFF',
    !.
b191(0000, default).
b192(0000, "Password B Setting (Disabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/password_b_setting),"disabled"),
    !.
b192(Password,"Password B Setting"):-
    b_getval(spec, S),
    Password = S.get(auxiliary_function/password_b),
    Password >= 0001, 
    Password =< 'FFFF',
    !.
b192(0000, default).
b193(Password, "Password B for Authentication"):- 
    b_getval(spec, S),
    Password = S.get(auxiliary_function/password_b_for_authentication),
    Password >= 0000, 
    Password =< 'FFFF',
    !.
b193(0000, default).

%% Electronic thermal
b910(00, "Motor Electronic Thermal Selection (Disabled)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/motor_electronic_thermal_selection),"disabled"),
    !.
b910(01, "Motor Electronic Thermal Selection (Enabled, Fixed subtraction ratio)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/motor_electronic_thermal_selection),"enabled (fixed subtraction ratio)"),
    !.
b910(02, "Motor Electronic Thermal Selection (Enabled, b911 subtraction ratio)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/motor_electronic_thermal_selection),"enabled (b911 subtraction ratio)"),
    !.
b910(03, "Motor Electronic Thermal Selection (Enabled, b912 time parameter subtraction)"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(auxiliary_function/motor_electronic_thermal_selection),"enabled (b912 time parameter subtraction)"),
    !.
b910(03, default).

b911(R, "Motor Electronic Thermal Subtraction Ratio (upper 4 digits) (s)"):-
    b_getval(spec, S),
    R #= S.get(auxiliary_function/motor_electronic_thermal_subtraction_ratio),
    R #>= 0.10, 
    R #=< 100000.00,
    !.
b911(600.00, default).
b912(T, "Motor Electronic Thermal Subtraction Time Constant (upper 4 digits) (s)"):- 
    b_getval(spec, S),
    T #= S.get(auxiliary_function/motor_electronic_thermal_subtraction_time_constant),
    T #>= 0.10, 
    T #=< 100000.00,
    !.
b912(120.00, default).
b913(G, "Motor Electronic Thermal Integration Gain"):- 
    b_getval(spec, S),
    G #= S.get(auxiliary_function/motor_electronic_thermal_integration_gain),
    G #>= 1.0, 
    G #=< 200.0,
    !.
b913(100.0, default).
