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

b014(00, "Reduced torque characteristics"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/second_characteristics_selection),"reduced torque characteristics"),
    !.
b014(01, "Constant torque characteristics"):-
    b_getval(spec, S),
    #fuzzy_match_key_value(S.get(electronic_thermal/second_characteristics_selection),"constant torque characteristics"),
    !.
b014(02, "Free setting"):-
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
b021(01, default).
b221(01, default).
b022([], default).
b222([], default).
b023(1.0, default).
b223(1.0, default).
b024(01, default).
b025([], default).
b026(1.0, default).
b027(01, default).
b028([], default).
b029(0.5, default).
b030(00, default).

%% Lock
b031(01, default).

%% Auxiliary function
b033(10, default).
b034(0, default).
b035(00, default).
b036(2, default).
b037(00, default).
b038(001, default).
b039(00, default).

%% Torque limit
b040(00, default).
b041(200, default).
b042(200, default).
b043(200, default).
b044(200, default).
b045(00, default).
b046(00, default).

%% Mode
b049(00, default).

%% Deceleration Stop on Power Interruption
b050(00, default).
b051([], default).
b052([], default).
b053(1.00, default).
b054(0.00, default).

%% Window comparator
b060(100, default).
b061(0, default).
b062(0, default).
b063(0, default).
b064(100, default).
b065(0, default).
b070(255, default).
b071(255, default).

%% Auxiliary function
b075(40, default).
b078(00, default).
b079(1, default).
b082(1.50, default).
b083(10.0, default).
b084(00, default).
b085(00, default).
b086(1.00, default).
b087(00, default).
b088(00, default).
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


% group: power_interruption

% Parameter b001

% Function Name: Power Interruption/Undervoltage Restart Selection ​
% Monitor: Not applicable
% Data Range:

% 00: Trip ​
% 01: 0-Hz restart ​
% 02: Frequency matching restart ​
% 03: Trip after frequency matching deceleration stop ​
% 04: Frequency pull-in restart ​


% Method of Calculation: Selects the restart method after power interruption or undervoltage. ​


% Parameter b002

% Function Name: Allowable Power Interruption Time ​
% Monitor: Not applicable
% Data Range: 0.3 to 25.0 seconds
% Method of Calculation: Sets the maximum allowable time for power interruption before the inverter trips. ​


% Parameter b003

% Function Name: Restart Standby Time ​
% Monitor: Not applicable
% Data Range: 0.3 to 100.0 seconds
% Method of Calculation: Sets the time the inverter waits before restarting after power interruption. ​


% Parameter b004

% Function Name: Power Interruption/Undervoltage Trip Selection During Stop ​
% Monitor: Not applicable
% Data Range:

% 00: Disabled ​
% 01: Enabled ​
% 02: Disabled during stop and deceleration stop by turning off the RUN command ​


% Method of Calculation: Determines whether the inverter trips during stop due to power interruption or undervoltage. ​


% Parameter b005

% Function Name: Power Interruption Restart Count
% Monitor: Not applicable
% Data Range:

% 00: 16 times
% 01: No limit ​


% Method of Calculation: Sets the maximum number of restart attempts after power interruption.


% Parameter b007

% Function Name: Frequency Matching Lower Limit Frequency ​
% Monitor: Not applicable
% Data Range: 0.00 to 99.99 Hz (100.0 to 400.0 Hz in high-frequency mode)
% Method of Calculation: Sets the lower limit frequency for frequency matching during restart. ​


% Parameter b008

% Function Name: Overvoltage/Overcurrent Restart Selection ​
% Monitor: Not applicable
% Data Range:

% 00: Trip ​
% 01: 0-Hz restart ​
% 02: Frequency matching restart ​
% 03: Trip after frequency matching deceleration stop ​
% 04: Frequency pull-in restart ​


% Method of Calculation: Selects the restart method after overvoltage or overcurrent trip. ​


% Parameter b010

% Function Name: Overvoltage/Overcurrent Restart Count ​
% Monitor: Not applicable
% Data Range: 1 to 3 times
% Method of Calculation: Sets the maximum number of restart attempts after overvoltage or overcurrent trip. ​


% Parameter b011

% Function Name: Overvoltage/Overcurrent Restart Standby Time ​
% Monitor: Not applicable
% Data Range: 0.3 to 100.0 seconds
% Method of Calculation: Sets the time the inverter waits before restarting after overvoltage or overcurrent trip. ​


% group: Electronic thermal

% Parameter b012

% Function Name: 1st Electronic Thermal Level ​
% Monitor: Not applicable
% Data Range: 0.20 × Rated current to 1.00 × Rated current
% Method of Calculation: Sets the electronic thermal protection level for the motor. ​


% Parameter b013

% Function Name: 1st Electronic Thermal Characteristics Selection
% Monitor: Not applicable
% Data Range:

% 00: Reduced torque characteristics ​
% 01: Constant torque characteristics ​
% 02: Free setting ​


% Method of Calculation: Selects the thermal protection characteristics for the motor.


% Parameter b015 to b020

% Function Name: Free-electronic Thermal Settings (Frequency and Current Levels)
% Monitor: Not applicable
% Data Range:

% Frequency: 0.00 to 400.0 Hz (580.0 Hz in high-frequency mode) ​
% Current: 0.00 to 1.00 × Rated current


% Method of Calculation: Configures custom thermal protection settings based on frequency and current levels.


% group: Overload limit, overcurrent protection

% Parameter b021 to b025

% Function Name: Overload Limit Settings ​
% Monitor: Not applicable
% Data Range:

% Level: 0.20 × Rated current to 2.00 × Rated current (Heavy load) ​
% Time: 0.1 to 3000 seconds


% Method of Calculation: Sets overload protection levels and time parameters. ​


% Parameter b027

% Function Name: Overcurrent Suppression Selection ​
% Monitor: Not applicable
% Data Range:

% 00: Disabled ​
% 01: Enabled ​
% 02: Enabled (at reduced voltage startup) ​


% Method of Calculation: Enables or disables overcurrent suppression. ​


% Parameter b028 to b030

% Function Name: Frequency Pull-in Restart Settings ​
% Monitor: Not applicable
% Data Range:

% Level: 0.20 × Rated current to 2.00 × Rated current ​
% Time: 0.1 to 3000 seconds


% Method of Calculation: Configures restart settings for frequency pull-in after a trip. ​

% group: Lock

% Parameter b031

% Function Name: Soft Lock Selection ​
% Monitor: Not applicable
% Data Range:

% 00 to 10: Various lock settings


% Method of Calculation: Restricts parameter changes based on lock settings. ​


% group: Auxiliary function

% Parameter b033

% Function Name: Motor Cable Length ​
% Monitor or Data Range: 5 to 20 meters
% Default Data: 10 meters
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: meters
% Description: Sets the cable length between the inverter and the motor to optimize operation. ​

% Parameter b034

% Function Name: RUN Time/Power ON Time Detection Level ​
% Monitor or Data Range:

% 0: Disabled (Function does not activate) ​
% 1 to 9999: Detection level in hours ​
% 1000 to 6553: Extended detection level (10-hour increments) ​


% Default Data: 0 (Disabled) ​
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: 10 hours ​
% Description: Sets the detection level for total RUN time or power ON time. ​

% Parameter b035

% Function Name: RUN Direction Limit Selection ​
% Monitor or Data Range:

% 00: No direction limit ​
% 01: Only Forward is enabled (Reverse is limited) ​
% 02: Only Reverse is enabled (Forward is limited) ​


% Default Data: 00 (No direction limit) ​
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Disabled ​
% Unit: None
% Description: Restricts the motor's rotation direction to forward or reverse. ​

% Parameter b036

% Function Name: Reduced Voltage Startup Selection ​
% Monitor or Data Range:

% 0: Reduced voltage startup disabled ​
% 1 to 255: Reduced voltage startup time (short to long) ​


% Default Data: 2
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Enabled ​
% Unit: None
% Description: Configures the reduced voltage startup time to prevent inrush current. ​

% Parameter b037 ​

% Function Name: Display Selection ​
% Monitor or Data Range:

% 00: Complete display ​
% 01: Individual display of functions ​
% 02: User setting + d001, F001, b037 ​
% 03: Data comparison display ​
% 04: Basic display ​
% 05: Monitor display + b037 ​


% Default Data: 00 (Complete display) ​
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: None ​
% Description: Configures the display mode for the Digital Operator. ​

% Parameter b038

% Function Name: Initial Screen Selection ​
% Monitor or Data Range:

% 000: Screen on which the Enter key was last pressed ​
% 001 to 060: d001 to d060
% 201: F001 ​
% 202: Do not set ​


% Default Data: 001 (d001: Output Frequency Monitor) ​
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: None ​
% Description: Sets the initial screen displayed on the Digital Operator after power-on. ​

% Parameter b039 ​

% Function Name: User Parameter Automatic Setting Function ​
% Monitor or Data Range:

% 00: Disabled ​
% 01: Enabled ​


% Default Data: 00 (Disabled) ​
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: None
% Description: Enables or disables automatic registration of changed parameters as user parameters. ​


% group: Torque limit
% Parameter b040

% Function Name: Torque Limit Selection
% Monitor or Data Range:

% 00: Four-quadrant separate setting ​
% 01: Terminal switching ​
% 02: Analog voltage input ​
% 03: Option (No applicable option) ​


% Default Data: 00 (Four-quadrant separate setting) ​
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: None ​
% Description: Configures the torque limit mode for the inverter. ​

% Parameter b041

% Function Name: Torque Limit 1 (Forward Power Running) ​
% Monitor or Data Range:

% 0.0 to 200.0: Torque limit percentage ​
% 255: No (Torque limit disabled) ​


% Default Data: 200.0
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the torque limit for forward power running in four-quadrant mode. ​

% Parameter b042

% Function Name: Torque Limit 2 (Reverse Regeneration)
% Monitor or Data Range:

% 0.0 to 200.0: Torque limit percentage ​
% 255: No (Torque limit disabled) ​


% Default Data: 200.0
% Set Data: Adjustable ​
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the torque limit for reverse regeneration in four-quadrant mode. ​

% Parameter b043

% Function Name: Torque Limit 3 (Reverse Power Running) ​
% Monitor or Data Range:

% 0.0 to 200.0: Torque limit percentage ​
% 255: No (Torque limit disabled) ​


% Default Data: 200.0
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the torque limit for reverse power running in four-quadrant mode. ​

% Parameter b044

% Function Name: Torque Limit 4 (Forward Regeneration) ​
% Monitor or Data Range:

% 0.0 to 200.0: Torque limit percentage ​
% 255: No (Torque limit disabled) ​


% Default Data: 200.0
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the torque limit for forward regeneration in four-quadrant mode. ​

% Parameter b045

% Function Name: Torque LADSTOP Selection ​
% Monitor or Data Range:

% 00: Disabled ​
% 01: Enabled ​


% Default Data: 00 (Disabled) ​
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Enabled ​
% Unit: None
% Description: Temporarily stops the frequency acceleration/deceleration function (LAD) when the torque limit function is activated. ​

% Parameter b046

% Function Name: Reverse Rotation Prevention Selection ​
% Monitor or Data Range:

% 00: Disabled ​
% 01: Enabled (Motor does not rotate in reverse) ​


% Default Data: 00 (Disabled) ​
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Enabled ​
% Unit: None
% Description: Prevents the motor from rotating in the reverse direction when sensorless vector control is enabled. ​


% group: Mode
% Parameter b049 ​

% Function Name: Heavy Load/Light Load Selection ​
% Monitor or Data Range:

% 00: Heavy load mode (CT - Constant Torque) ​
% 01: Light load mode (VT - Variable Torque) ​


% Default Data: 00 (Heavy load mode) ​
% Set Data: Adjustable
% Setting During RUN: Disabled
% Changes During RUN: Disabled ​
% Unit: None ​

% Description:
% This parameter configures the inverter's operating mode based on the load type:


% Heavy Load Mode (CT):

% Provides an overload capacity of 150% of the rated current for 1 minute. ​
% Suitable for applications requiring high torque, such as elevators, cranes, conveyors, mixers, or hoists. ​
% Supports high-frequency mode. ​



% Light Load Mode (VT):

% Provides an overload capacity of 120% of the rated current for 1 minute. ​
% Suitable for applications with lower torque requirements, such as fans, pumps, air conditioners, or other variable torque applications. ​



% Precautions for Correct Use:

% Switching between modes affects the inverter's rated current, overload detection settings, and carrier frequency range. ​
% Changing from heavy load mode to light load mode causes parameter settings to be initialized, requiring reconfiguration. ​
% Switching modes requires the inverter to be stopped. ​
% Some functions, such as sensorless vector control, are unavailable in light load mode. ​


% group: Deceleration Stop on Power Interruption
% Parameter b050

% Function Name: Deceleration Stop Selection on Power Interruption ​
% Monitor or Data Range:

% 00: Disabled ​
% 01: Enabled (Deceleration stop) ​
% 02: Enabled (Constant voltage, without recovery) ​
% 03: Enabled (Constant voltage, with recovery) ​


% Default Data: 00 (Disabled) ​
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Disabled ​
% Unit: None
% Description: Configures the inverter's behavior during power interruptions. ​ Options include no deceleration stop, deceleration stop, maintaining constant voltage without recovery, or maintaining constant voltage with recovery. ​

% Parameter b051 ​

% Function Name: Starting Voltage on Power Interruption ​
% Monitor or Data Range:

% 200-V class: 0.0 to 999.9
% 400-V class: 0.0 to 999.9


% Default Data:

% 200-V class: 220.0 ​
% 400-V class: 440.0 ​


% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Disabled ​
% Unit: V ​
% Description: Sets the voltage level at which the inverter starts deceleration during a power interruption. ​

% Parameter b052

% Function Name: Deceleration Hold Level on Power Interruption ​
% Monitor or Data Range:

% 200-V class: 0.0 to 999.9
% 400-V class: 0.0 to 999.9


% Default Data:

% 200-V class: 360.0
% 400-V class: 720.0


% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Disabled ​
% Unit: V ​
% Description: Sets the voltage level at which the inverter holds deceleration during a power interruption to prevent overvoltage. ​

% Parameter b053

% Function Name: Deceleration Time on Power Interruption ​
% Monitor or Data Range:

% 0.01 to 99.99 ​
% 100.0 to 999.9 ​
% 1000. to 3600. ​


% Default Data: 1.00
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Disabled
% Unit: s
% Description: Sets the deceleration time for the inverter to stop during a power interruption. ​

% Parameter b054

% Function Name: Deceleration Starting Width on Power Interruption ​
% Monitor or Data Range:

% 0.00 to 10.00 ​
% 100.0 (High-frequency mode)


% Default Data: 0.00
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Disabled
% Unit: Hz ​
% Description: Sets the frequency width at which deceleration starts during a power interruption. ​ Proper configuration is necessary to avoid overcurrent or undervoltage issues.


% group: Window comparator
% Parameter b060

% Function Name: Window Comparator FV Upper Limit Level ​
% Monitor or Data Range:

% 0.0 to 100.0 ​


% Default Data: 100.0
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the upper limit level for the window comparator function for the FV (Analog Voltage Input). ​


% Parameter b061

% Function Name: Window Comparator FV Lower Limit Level ​
% Monitor or Data Range:

% 0.0 to 100.0 ​


% Default Data: 0.0
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the lower limit level for the window comparator function for the FV (Analog Voltage Input). ​


% Parameter b062

% Function Name: Window Comparator FV Hysteresis Width ​
% Monitor or Data Range:

% 0.0 to 10.0 ​


% Default Data: 0.0
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the hysteresis width for the upper and lower limit levels of the window comparator for the FV input. ​


% Parameter b063

% Function Name: Window Comparator FI Upper Limit Level ​
% Monitor or Data Range:

% 0.0 to 100.0 ​


% Default Data: 100.0
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the upper limit level for the window comparator function for the FI (Analog Current Input). ​


% Parameter b064

% Function Name: Window Comparator FI Lower Limit Level ​
% Monitor or Data Range:

% 0.0 to 100.0 ​


% Default Data: 0.0
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the lower limit level for the window comparator function for the FI (Analog Current Input). ​


% Parameter b065

% Function Name: Window Comparator FI Hysteresis Width ​
% Monitor or Data Range:

% 0.0 to 10.0 ​


% Default Data: 0.0
% Set Data: Adjustable
% Setting During RUN: Enabled
% Changes During RUN: Enabled ​
% Unit: %
% Description: Sets the hysteresis width for the upper and lower limit levels of the window comparator for the FI input. ​


% Parameter b070

% Function Name: Analog Operation Level at FV Disconnection ​
% Monitor or Data Range:

% 0.0 to 100.0 ​
% 255: No (Disabled) ​


% Default Data: No ​
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Enabled ​
% Unit: None ​
% Description: Sets the operation level for the inverter when the FV (Analog Voltage Input) is disconnected. ​


% Parameter b071

% Function Name: Analog Operation Level at FI Disconnection ​
% Monitor or Data Range:

% 0.0 to 100.0 ​
% 255: No (Disabled) ​


% Default Data: No ​
% Set Data: Adjustable
% Setting During RUN: Disabled ​
% Changes During RUN: Enabled ​
% Unit: None
% Description: Sets the operation level for the inverter when the FI (Analog Current Input) is disconnected. ​Description: Sets the operation level for the inverter when the FI (Analog Current Input) is disconnected. ​





% group: Auxiliary function
% Parameters b075 to b097


% Parameter b075: Ambient Temperature ​

% Range: −10 to 50 °C ​
% Default Data: 40 °C ​
% Set Data: Adjustable
% Description: Sets the ambient temperature in the operating environment of the inverter. ​



% Parameter b078: Integrated Power Clear ​

% Range: 00 (Clear disabled), 01 (Clear with Enter key)
% Default Data: 00 ​
% Set Data: Adjustable
% Description: Clears the integrated power monitor data when enabled. ​



% Parameter b079: Integrated Power Display Scale ​

% Range: 1.0 to 1000.0 ​
% Default Data: 1.0
% Set Data: Adjustable
% Description: Sets the scaling factor for the integrated power display. ​



% Parameter b082: Starting Frequency ​

% Range: 0.01 to 9.99 Hz (100.0 Hz in high-frequency mode)
% Default Data: 1.50 Hz ​
% Set Data: Adjustable
% Description: Sets the frequency at which the inverter starts operation. ​



% Parameter b083: Carrier Frequency ​

% Range: 2.0 to 15.0 kHz (Heavy load mode), 2.0 to 10.0 kHz (Light load mode) ​
% Default Data: 10.0 kHz (Heavy load mode), 2.0 kHz (Light load mode)
% Set Data: Adjustable
% Description: Sets the carrier frequency for the inverter. ​



% Parameter b084: Initialization Selection ​

% Range: 00 (Disabled), 01 (Clearing Fault Monitor), 02 (Initialize data), 03 (Clear fault monitor + Initialize data), 04 (Clear fault monitor + Initialize data + Clear DriveProgramming) ​
% Default Data: 00 ​
% Set Data: Adjustable
% Description: Selects the type of initialization to perform on the inverter. ​



% Parameter b085: Initialization Data Selection ​

% Range: Fixed at 00
% Default Data: 00 ​
% Set Data: Fixed
% Description: Reserved for initialization data selection. ​



% Parameter b086: Frequency Conversion Coefficient ​

% Range: 0.01 to 99.99 ​
% Default Data: 1.00
% Set Data: Adjustable
% Description: Converts the output frequency value for monitoring purposes. ​



% Parameter b087: STOP Key Selection ​

% Range: 00 (Enabled), 01 (Disabled), 02 (Only RESET enabled)
% Default Data: 00 ​
% Set Data: Adjustable
% Description: Configures the functionality of the STOP key on the Digital Operator. ​



% Parameter b088: Free-run Stop Selection ​

% Range: 00 (0-Hz restart), 01 (Frequency matching restart), 02 (Frequency pull-in restart) ​
% Default Data: 00 ​
% Set Data: Adjustable
% Description: Configures the inverter's behavior during free-run stop. ​



% Parameter b089: Automatic Carrier Reduction ​

% Range: 00 (Disabled), 01 (Enabled based on current), 02 (Enabled based on cooling fin temperature) ​
% Default Data: 01 ​
% Set Data: Adjustable
% Description: Enables automatic carrier frequency reduction based on current or cooling fin temperature. ​



% Parameter b090: Usage Rate of Regenerative Braking ​

% Range: 0.0 to 100.0 % ​
% Default Data: 0.0 %
% Set Data: Adjustable
% Description: Sets the usage rate of regenerative braking. ​



% Parameter b091: Stop Selection ​

% Range: 00 (Deceleration stop), 01 (Free-run stop) ​
% Default Data: 00 ​
% Set Data: Adjustable
% Description: Configures the stop method for the inverter. ​



% Parameter b092: Cooling Fan Operation ​

% Range: 00 (Always enabled), 01 (Enabled only during operation), 02 (Dependent on cooling fin temperature) ​
% Default Data: 01 ​
% Set Data: Adjustable
% Description: Configures the cooling fan operation mode based on inverter status or temperature. ​



% Parameter b093: Total Fan Operation Time Clear ​

% Range: 00 (Clear disabled), 01 (Clear with Enter key)
% Default Data: 00 ​
% Set Data: Adjustable
% Description: Clears the total fan operation time, typically done when replacing the cooling fan. ​



% Parameter b097: Not specified in the provided document.



% group: V/f free function
% Parameters b100 to b113 are used to configure the Free V/f function, which allows adjustment of the inverter's output voltage and frequency characteristics at specific breakpoints. The parameters include frequency and voltage settings for up to seven breakpoints, enabling custom V/f characteristics for specialized motor control scenarios. ​


% Frequency Parameters:

% b100: Free V/f Frequency 1 ​
% b102: Free V/f Frequency 2 ​
% b104: Free V/f Frequency 3 ​
% b106: Free V/f Frequency 4 ​
% b108: Free V/f Frequency 5 ​
% b110: Free V/f Frequency 6 ​
% b112: Free V/f Frequency 7 ​



% Voltage Parameters:

% b101: Free V/f Voltage 1 ​
% b103: Free V/f Voltage 2 ​
% b105: Free V/f Voltage 3 ​
% b107: Free V/f Voltage 4 ​
% b109: Free V/f Voltage 5 ​
% b111: Free V/f Voltage 6 ​
% b113: Free V/f Voltage 7 ​



% Notes:

% Frequency values must be set in ascending order: f1 ≤ f2 ≤ f3 ≤ f4 ≤ f5 ≤ f6 ≤ f7. ​
% Voltage values correspond to the respective frequency points. ​
% The Free V/f function is disabled by default and can be enabled by setting the 1st/2nd Control Method (A044/A244) to 02 (Free V/f setting).
% When enabled, torque boost, base frequency, and maximum frequency settings are disabled. ​
% Frequency ranges are typically 0.0 to 400.0 Hz (580.0 Hz in high-frequency mode), and voltage ranges are 0.0 to 800.0 V.



% group: Brake control
% Parameters b120 to b127 are used to configure the Brake Control Function in the inverter, which is essential for managing external brakes in applications like elevators, cranes, or systems requiring precise braking control. ​ Below are the details of each parameter:


% b120: Brake Control Function Selection ​

% Range:

% 00: Disabled ​
% 01: Enabled (DC Injection Braking enabled during stop) ​
% 02: Enabled (DC Injection Braking disabled during stop) ​


% Default Data: 00 ​
% Description: Enables or disables the brake control function and specifies DC Injection Braking behavior during stop. ​



% b121: Brake Release Wait Time ​

% Range: 0.00 to 5.00 seconds
% Default Data: 0.00 seconds ​
% Description: Sets the time the inverter waits after reaching the Brake Release Frequency before outputting the brake release signal. ​



% b122: Acceleration Wait Time on Brake Control ​

% Range: 0.00 to 5.00 seconds
% Default Data: 0.00 seconds ​
% Description: Sets the mechanical delay time from when the brake release signal turns ON until the brake is fully released. ​



% b123: Stop Wait Time on Brake Control ​

% Range: 0.00 to 5.00 seconds
% Default Data: 0.00 seconds ​
% Description: Sets the mechanical delay time from when the brake release signal turns OFF until the brake is fully applied. ​



% b124: Brake Error Detection Time ​

% Range: 0.00 to 5.00 seconds
% Default Data: 0.00 seconds ​
% Description: Sets the time the inverter waits for the brake confirmation signal to turn ON after outputting the brake release signal. ​ If the signal does not turn ON within this time, the inverter detects a brake error. ​



% b125: Brake Release Frequency ​

% Range: 0.00 to 400.0 Hz ​
% Default Data: 0.00 Hz ​
% Description: Sets the frequency at which the brake release signal is output. ​



% b126: Brake Release Current ​

% Range: 0.00 to 2.00 × Rated current of inverter ​
% Default Data: Rated current of inverter ​
% Description: Sets the output current value sufficient to support the load and output the brake release signal. ​



% b127: Brake Force Frequency ​

% Range: 0.00 to 400.0 Hz
% Default Data: 0.00 Hz ​
% Description: Sets the frequency at which the brake release signal turns OFF and forces the brake during stop. ​



% Notes:

% Proper configuration of these parameters ensures smooth operation and prevents mechanical damage or load fall accidents. ​
% It is recommended to use Sensorless Vector Control for high torque during startup. ​
% Ensure the frequency set in b125 is higher than the Starting Frequency (b082) to avoid overload detection.



% group: Overvoltage suppression during deceleration
% Parameters b130 to b134 are used to configure the Overvoltage Suppression Function During Deceleration, which prevents overvoltage trips caused by regenerative energy during motor deceleration. Below are the details of each parameter:


% b130: Overvoltage Suppression Function Selection During Deceleration ​

% Range:

% 00: Disabled ​
% 01: Enabled (DC voltage kept constant) ​
% 02: Enabled (Acceleration enabled)


% Default Data: 01 (Enabled: DC voltage kept constant) ​
% Description: Enables or disables the overvoltage suppression function during deceleration. ​ When enabled, the inverter adjusts the deceleration rate or accelerates to suppress overvoltage. ​



% b131: Overvoltage Suppression Level During Deceleration ​

% Range:

% 200-V class: 330.0 to 395.0 V
% 400-V class: 660.0 to 790.0 V


% Default Data:

% 200-V class: 380.0 V
% 400-V class: 760.0 V


% Description: Sets the DC voltage level at which the overvoltage suppression function activates. Ensure this value is higher than the input voltage multiplied by √2 to avoid deceleration issues. ​



% b132: Overvoltage Suppression Parameter During Deceleration ​

% Range: 0.10 to 30.00 seconds
% Default Data: 1.00 seconds
% Description: Sets the acceleration rate or deceleration time for the output frequency when the overvoltage suppression function is enabled. ​ This determines how quickly the suppression function reacts.



% b133: Overvoltage Suppression Proportional Gain During Deceleration ​

% Range: 0.00 to 5.00 ​
% Default Data: 0.20 ​
% Description: Sets the proportional gain for DC voltage constant control. ​ Higher values result in faster suppression response but may increase the risk of overcurrent trips. ​



% b134: Overvoltage Suppression Integral Time During Deceleration ​

% Range: 0.0 to 150.0 seconds
% Default Data: 1.0 seconds
% Description: Sets the integral time for DC voltage constant control. ​ Lower values provide faster response but may increase the risk of overcurrent trips. ​



% Notes:

% Proper configuration of these parameters ensures smooth deceleration without overvoltage trips. ​
% Adjust b133 and b134 carefully to balance suppression speed and stability. ​
% If regenerative braking units or braking resistors are used, these settings may need adjustment to optimize performance. ​
% For applications with high inertia loads, such as elevators or conveyors, these parameters are critical to prevent overvoltage errors caused by regenerative energy. ​

% group: Auxiliary function

% b145 GS Input Operation Selection
% 00: No trip (shut off by hardware)
% 01: Trip

% b150 Inverter Display on Operator Connection
% 001 to 060 (Corresponding to d001 to d060)

% b160 User Monitor Selection 1
% 001 to 030 (Corresponding to d001 to d030)

% b161 User Monitor Selection 2
% 001 to 030 (Corresponding to d001 to d030)

% b163 d001/d007 Data Setting Selection
% 00: Disabled
% 01: Enabled

% b164 Initial Screen Automatic Return Function
% 00: Disabled
% 01: Enabled

% b165 Operation Selection at External Operator Disconnection
% 00: Trip
% 01: Trip after deceleration stop
% 02: Ignore
% 03: Free-run stop
% 04: Deceleration stop

% b166 (Reserved) Do not change the default 00




% group: Mode
% b171 Inverter Mode Selection
% 00: Selection disabled
% 01: Induction motor mode
% 02: Induction motor high-frequency mode
% 03: PM motor mode

% group: Auxiliary function

% b180 Initialization Execution
% 00: Function disabled
% 01: Execute initialization

% b190 Password A Setting
% 0000: Function disabled
% 0001 to FFFF: Password

% b191 Password A for Authentication 
% 0000 to FFFF

% b192 Password B Setting
% 0000: Function disabled
% 0001 to FFFF: Password

% b193 Password B for Authentication 
% 0000 to FFFF


% group: Electronic thermal
% b910 Motor Electronic Thermal Selection
% 00: Disabled
% 01: Enabled (Fixed subtraction ratio)
% 02: Enabled (b911 subtraction ratio)
% 03: Enabled (b912 time parameter subtraction)

% b911 Motor Electronic Thermal Subtraction Ratio
% 0.10 to 100000.00
% (Displays upper 4 digits)

% b912 Motor Electronic Thermal Subtraction Time Constant
% 0.10 to 100000.00
% (Displays upper 4 digits)

% b913 Motor Electronic Thermal Integration Gain
% 1.0 to 200.0