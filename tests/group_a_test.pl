:- begin_tests(group_a).

:- ["../param/group_a"].

load_spec(D):-
    b_setval(spec, D).



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
a001(01,"voltage (FV)").

test(
	"a001 = 01 when speed_reference is voltage (FV) miss-spelt as Voltege (FV)", 
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
		a001(01,"voltage (FV)").

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
    a001(01,"current (FI)").


test(
"a001 = 01 when speed_reference is miss-spelt as Carrent_(FI)", 
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
    a001(01,"current (FI)").




:- end_tests(group_a).