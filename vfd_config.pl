:- 
    yaml_read('setup.yaml', YAML),
    print_term(YAML.inverter.accessories , []).

:- dynamic setup/1.

setup(YAML):- 
    yaml_read('setup.yaml', YAML).

a001('00') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Digital Operator (Volume)",
    YAML.inverter.accessories = "3G3AX-OP01".

a001('01') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Control circuit terminal block (Analog input)".

a001('01') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "voltage (FV)".

a001('01') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "current (FI)".

a001('02') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Digital Operator (F001)".

a001('03') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Modbus communication".

a001('04') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Option".

a001('06') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Pulse train frequency".

a001('07') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "DriveProgramming".

a001('10') :- 
    setup(YAML),
    YAML.motor.'1st'.speed_reference = "Operation function output".
    