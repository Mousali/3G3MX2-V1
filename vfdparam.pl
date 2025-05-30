#!/usr/bin/swipl -q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vfdparam  -   Calculate VFD parameter values given a VFD and motor 
%               specification YAML file. 
%  
% USAGE:
%   vfdparam.pl [--calculated-only] SPEC_FILENAME
%
% OPTIONS:
%   --calculated-only  -c  boolean=false    Print calculated parameter values only
%   --help             -h  boolean=false    Show this help message
%   --output-file      -o  FILE:atom=false  write output to FILE
%
% INPUT:
%   Specification YAML string from stdin or specification YAML filename.
%
% OUTPUT:
%   Prints VDF parameter values to stdout or output file.
%
% EXIT STATUS:
%   - 0: Success
%   - 1: File error or invalid YAML
%
% AUTHOR:
%   Ammar Mousali
%
% LICENSE:
%   GNU AFFERO GENERAL PUBLIC LICENSE
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- consult("param/group_a").
:- consult("param/group_b").
:- consult("param/group_c").
:- consult("param/group_d").
:- consult("param/group_f").
:- consult("param/group_h").
:- consult("param/group_p").
:- consult("param/group_u").

:- use_module(library(optparse)).
:- initialization(main, main).

main(Args):-
    OptsSpec=[
        [opt(calculated_only), type(boolean), default(false),shortflags([c]), longflags(['calculated-only']),help('Print calculated parameter values only')], 
        [opt(help), type(boolean), shortflags([h]), longflags([help]), help('Show this help message'), default(false)],
        [opt(outfile), meta('FILE'), type(atom), shortflags([o]), longflags(['output-file']),help('write output to FILE'), default(user_output)]
    ],
    opt_parse( OptsSpec, Args, Ops, PositionalArgs),

    (
        Ops.help == true ->
        (
            opt_help(OptsSpec, Help),
            format('USAGE:~n~+vfdparam [OPTION]... [SPEC_YAML_FILENAME]~n~nCalculate Omron VFD configuration parameters from YAML VFD and motor specification file.~n~nOPTIONS:~n~w~n', [Help]),
            halt(0)
        ); true
    ),
    ( 
        PositionalArgs = [SpecFilename|_] ->
        (
            % read spec from YAML file
            yaml_read(SpecFilename, Str),
            b_setval(spec, Str)
        );(
            % read spec POSIX stdin
            yaml_read(user_input,Str),
            b_setval(spec, Str)
        )
    ),
    open(Ops.outfile, write, _, [create([write]),alias(output)]),
    vfdparam(Ops),
    halt(0).

vfdparam(Ops):-
    Ops.calculated_only == true,

    findall(Name, 
    ( 
        current_predicate(Name/2),
        re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",Name)
    ), Params),
    sort(Params, UniqueParams),

    % Print calculated values only
    findall([Param, Value], 
    (
        member(Param, UniqueParams), 
        call(Param,Value, calculated),

        string_upper(Param,Uppercase_Param),
        format(output, '~w: ~w~n', [Uppercase_Param,Value])
    ), _).

vfdparam(Ops):-
    Ops.calculated_only == false,

    findall(Name, 
    ( 
        current_predicate(Name/2),
        re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",Name)
    ), Params),
    sort(Params, UniqueParams),

    % Print all parameter values
    findall([Param, Value], 
    (
        member(Param, UniqueParams), 
        call(Param,Value, _),

        string_upper(Param,Uppercase_Param), 
        format(output, '~w: ~w~n', [Uppercase_Param,Value])
    ), _).
