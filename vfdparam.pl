#!/usr/bin/swipl -q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vfdparam - Extract VFD parameters from a motor and VFD YAML specification
%  
% DESCRIPTION:
%   Calculate Omron VFD configuration parameters from YAML VFD and motor 
%   specification file.
%
% USAGE:
%   Run as a standalone script:
%     $ vfdparam.pl [--full] SPEC_FILENAME
%
% INPUT:
%   - A YAML file path (e.g., 'spec.yaml') containing VDF parameters.
%
% OUTPUT:
%   - Prints non-default VDF parameters in YAML format to stdout.
%
% REQUIREMENTS:
%   - SWI-Prolog.
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

:- use_module(library(optparse)).
:- initialization(main, main).

main(Args):-
    OptsSpec=[
        [opt(change_only), type(boolean), default(false),shortflags([c]), longflags(['changed-only']),help('Print parameter change summary only')], 
        [opt(help), type(boolean), shortflags([h]), longflags([help]), help('Show this help message'), default(false)],
        [opt(outfile), meta('FILE'), type(atom),shortflags([o]), longflags(['output-file']),help('write output to FILE'), default(false)]
    ],
    opt_parse( OptsSpec, Args, Ops, PositionalArgs),

    (
        Ops.help == true ->
        (
            opt_help(OptsSpec, Help),
            format('USAGE:~+vfdprama [OPTION]... SPEC_YAML_FILENAME~nCalculate Omron VFD configuration parameters from YAML VFD and motor specification file.~nOPTIONS:~n~w~n', [Help]),
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

    % cycle through all parameters.
    % Print if a parameter value different from default. 
    findall([Upper_X, Y], 
    ( 
        current_predicate(X/1),
        re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",X),
        call(X,Y), 
        string_upper(X,Upper_X), 
        atom_concat(X,'_default', X_default),
        call(X_default,Y_default),
        Y \= Y_default,
        writef('%w : %6r\n', [Upper_X,Y])            
    ), _).

vfdparam(Ops):-
    Ops.change_only == false,

    % cycle through all parameters.
    findall([Upper_X, Y], 
    ( 
        current_predicate(X/1),
        re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",X),
        call(X,Y), 
        string_upper(X,Upper_X), 
        writef('%w : %6r\n', [Upper_X,Y])            
    ), _).

% Load default predicates
:- consult("defaults/group_a_default").
:- consult("defaults/group_b_default").
:- consult("defaults/group_c_default").
:- consult("defaults/group_d_default").
:- consult("defaults/group_f_default").
:- consult("defaults/group_h_default").
:- consult("defaults/group_p_default").
:- consult("defaults/group_u_default").

:- consult("param/group_a").
:- consult("param/group_b").
:- consult("param/group_c").
:- consult("param/group_d").
:- consult("param/group_f").
:- consult("param/group_h").
:- consult("param/group_p").
:- consult("param/group_u").
