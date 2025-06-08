:- begin_tests(group_f).

load_spec(Test_Spec):-
    b_setval(spec, Test_Spec).

test(
"f001 = 20 Hz when start_rpm is 1200",
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
    f001(20, "starting frequency").

test(
"f001 = 20 Hz when start_rpm is 1200",
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
    f001(10, "Maximum VFD starting frequency").

:- end_tests(group_f).