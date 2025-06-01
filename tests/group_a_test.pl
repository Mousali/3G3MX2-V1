:- begin_tests(group_a).

:- ["../param/group_a"].

load_spec(D):-
    b_setval(spec, D).

test(
    "a001 is ok", 
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
    a001(01,calculated).

:- end_tests(group_a).