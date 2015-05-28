:- module(data_structures,[
]).

/*
 * Tests
 */
 
:- begin_tests('data structures').

test('Arithmetic expression is a structure usually written in infix notation') :-
	X = a+b*c,
	Y = +(a,*(b,c)),
	assertion(X ==Y).

:- end_tests('data structures').
