:- begin_tests(group_a).

load_spec(Test_Spec):-
    b_setval(spec, Test_Spec).

test(
"a001 = 01 when 1st Frequency Reference Selection is Control circuit terminal block (Analog input)", 
[
setup(
load_spec(
dict{
    motor:dict{
        '1st':
        dict{
            frequency_reference_selection:"Control circuit terminal block (Analog input)"
            }
        }
	}
)
)
]
):- 
    a001(V,M),
    assertion(V == 01),
    assertion(M == "Control circuit terminal block (Analog input)").

test(
"a001 = 01 when 1st Frequency Reference Selection misspell as 'control circuit terminal blck Analog input'", 
	[
	setup(
	load_spec(
	dict{
		motor:dict{
			'1st':
			dict{
				frequency_reference_selection: "control circuit terminal blck Analog input"
				}
			}
		}
	)
	)
	]
):- 
    a001(V,M),
    assertion(V == 01),
    assertion(M == "Control circuit terminal block (Analog input)").


:- end_tests(group_a).