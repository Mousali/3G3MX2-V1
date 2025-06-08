:- begin_tests(group_f).

load_spec(Test_Spec):-
    b_setval(spec, Test_Spec).

test(
"f001 = 20 Hz when starting rpm is 1200 and max rpm is 24000",
[
    setup(
        load_spec(
            dict{
                operation:dict{
                    start_rpm: 1200
                    },
                motor:dict{
                    '1st':dict{
                        rpm:dict{
                            min : 3000,
                            base : 24000,
                            max : 24000
                        },
                        poles: 2
                    }
                }
            }
        )
    )
]
):-
    f001(V, M),
    assertion(V == 20),
    assertion(M == "starting frequency").

test(
"f001 = 10 Hz when starting rpm is 1200 and max rpm is 600",
[
    setup(
        load_spec(
            dict{
                operation:dict{
                    start_rpm: 1200
                    },
                motor:dict{
                    '1st':dict{
                        rpm:dict{
                            min : 10,
                            base : 600,
                            max : 600
                        },
                        poles: 2
                    }
                }
            }
        )
    )
]
):-
    f001(V, M),
    assertion(V == 10),
    assertion(M == "Maximum VFD starting frequency").


:- end_tests(group_f).