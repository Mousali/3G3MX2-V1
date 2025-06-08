:- begin_tests(group_a).

load_spec(Test_Spec):-
    b_setval(spec, Test_Spec).

test(
"a001 = 01 when speed_reference is voltage (FV)", 
[
setup(
load_spec(
dict{
    motor:dict{
        '1st':
        dict{
            speed_reference:"voltage (FV)"
            }
        }
	}
)
)
]
):- 
    a001(V,M),
    assertion(V == 01),
    assertion(M == "voltage (FV)").

test(
	"a001 = 01 when speed_reference is voltage (FV) misspell as Voltege (FV)", 
	[
	setup(
	load_spec(
	dict{
		motor:dict{
			'1st':
			dict{
				speed_reference:"voltege (FV)"
				}
			}
		}
	)
	)
	]
):- 
    a001(V,M),
    assertion(V == 01),
    assertion(M == "voltage (FV)").

test(
"a001 = 01 when speed_reference is current (FI)", 
[
setup(
load_spec(
dict{
    motor:dict{
        '1st':
        dict{
            speed_reference:"current (FI)"
            }
        }
	}
)
)
]
):- 
    a001(V,M),
    assertion(V == 01),
    assertion(M == "current (FI)").


test(
"a001 = 01 when speed_reference is misspell as Carrent_(FI)", 
[
setup(
load_spec(
dict{
    motor:dict{
        '1st':
        dict{
            speed_reference:"Carrent_(FI)"
            }
        }
	}
)
)
]
):- 
    a001(V,M),
    assertion(V == 01),
    assertion(M == "current (FI)").




:- end_tests(group_a).