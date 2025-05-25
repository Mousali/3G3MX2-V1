#!/usr/bin/swipl -q
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% vfdparam - Extract VFD parameters from a motor and VFD YAML specification
%  
% DESCRIPTION:
%   This Prolog script reads a YAML file containing motor and Variable 
%   Frequency Drive (VFD) specification and outputs configuration parameters.
%   The script can only only those parameters that differ from their default 
%   values. 
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

:- initialization(main, main).

main([Spec_Filename]) :-
    yaml_read(Spec_Filename, S),
    b_setval(spec, S),

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
    ), _),
    halt.

main(['--full', Spec_Filename]) :-
    yaml_read(Spec_Filename, S),
    b_setval(spec, S),

    % cycle through all parameters.
    findall([Upper_X, Y], 
    ( 
        current_predicate(X/1),
        re_match("^[a,b,c,d,f,h,p,u]\\d{3}$",X),
        call(X,Y), 
        string_upper(X,Upper_X), 
        writef('%w : %6r\n', [Upper_X,Y])            
    ), _),
    halt.

:- consult("utilities.pl").

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
