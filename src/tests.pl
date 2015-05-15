:- begin_tests(lists).
:- use_module(library(lists)).

test(reverse) :-
	reverse([a,b], [b,a]).

test(add) :-
	A is 1+2,
	A =:= 3.

:- end_tests(lists).
