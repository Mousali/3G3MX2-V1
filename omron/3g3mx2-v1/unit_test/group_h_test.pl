:- begin_tests(group_h).

load_spec(Test_Spec):-
    b_setval(spec, Test_Spec).

test(
"h003 = 3.0 when motor capacity is 3.1 kw",
[
	setup(
		load_spec(
			dict{
				motor:dict{
					'1st':dict{
						power_kw: 3.1
					}
				}
			}
		)
	)
]
):-
	h003(V, M),
	assertion(V == 3.0),
	assertion(M == "Maximum applicable motor capacity (kw)").

test(
"h003 = 18.5 max VFD capacity for any motor lager than 18.5 kw (30.0 kw)",
[
	setup(
		load_spec(
			dict{
				motor:dict{
					'1st':dict{
						power_kw: 30.0
					}
				}
			}
		)
	)
]
):-
	h003(V, M),
	assertion(V == 18.5),
	assertion(M == "Maximum applicable motor capacity (kw)").


:- end_tests(group_h).