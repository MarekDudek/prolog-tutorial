:- module(last_but_one,[		
]).


%% last_but_one(?Elem, ?List).
%
%  True if Elem is second to last element of List.

last_but_one(Elem, [Elem, _Last]).
last_but_one(Elem, [_H|T]) :-
	last_but_one(Elem, T).

/* 
 * Test suite 
 */
:- begin_tests('last but one').

test('Last but one of empty list', fail) :-
	last_but_one(y, []).

test('Last but one of single element list', fail) :-
	last_but_one(y, [y]).
	
test('Last but one of two-element list', nondet) :- 
	last_but_one(E, [a, b]),
	assertion(E == a).

test('Last but one of five-element list', nondet) :- 
	last_but_one(E, [a, b, c, d, e]),
	assertion(E == d).

:- end_tests('last but one').
