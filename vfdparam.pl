#!/usr/bin/swipl -q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vfdparam  -   Calculate VFD parameter values given a VFD and motor 
%               specification YAML file. 
%
% USAGE:
%   Run as a standalone script:
%     $ vfdparam.pl [--calculated-only] SPEC_FILENAME
%
% OPTIONS:
%   --calculated-only  -c  boolean=false    Print calculated parameter values only
%   --help             -h  boolean=false    Show this help message
%   --output-file      -o  FILE:atom=false  write output to FILE
%
% INPUT:
%   - A YAML file path (e.g., 'spec.yaml') containing VDF parameters.
%
% OUTPUT:
%   - Prints non-default VDF parameters in YAML format to stdout.
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
        [opt(outfile), meta('FILE'), type(atom), shortflags([o]), longflags(['output-file']),help('write output to FILE'), default(false)]
    ],
    opt_parse( OptsSpec, Args, Ops, PositionalArgs),

    (
        Ops.help == true ->
        (
            opt_help(OptsSpec, Help),
            format('USAGE:~+vfdparam [OPTION]... SPEC_YAML_FILENAME~nCalculate Omron VFD configuration parameters from YAML VFD and motor specification file.~nOPTIONS:~n~w~n', [Help]),
            halt(0)
        ); true
    ),
    ( 
        PositionalArgs = [SpecFilename|_] ->
        (
            yaml_read(SpecFilename, S),
            b_setval(spec, S)
        ); true
    ),

    vfdparam(Ops),
    halt(0).

vfdparam(Ops):-
    Ops.change_only == true,

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
        call(Param,Value, computed),

        string_upper(Param,Uppercase_Param), 
        format('~w: ~w~n', [Uppercase_Param,Value])
    ), _).

vfdparam(Ops):-
    Ops.change_only == false,

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
        format('~w: ~w~n', [Uppercase_Param,Value])
    ), _).
