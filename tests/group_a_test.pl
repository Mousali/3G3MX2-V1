:- begin_tests(group_a).

:- ["../param/group_a"].

load_spec(SpecFilename):-
    yaml_read(SpecFilename, Str),
    b_setval(spec, Str).


test(
        "a001 is ok", 
        [ 
            setup(load_spec('test_spec.yaml'))
        ]
    ):- a001(1,calculated).

:- end_tests(group_a).