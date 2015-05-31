:- module(last_but_one,[		
]).


%% last_but_one(?Elem, ?List).
%
%
last_but_one(Elem, [Elem, _Last]).
last_but_one(Elem, [_H|T]) :-
	last_but_one(Elem, T).

/* 
 * Test suite 
 */
:- begin_tests('last but one').

test('last but one in empty list', fail) :-
	last_but_one(y, []).

test('last but one in single element list', fail) :-
	last_but_one(y, [y]).
	
test('last but one in two-element list', nondet) :- 
	last_but_one(y, [y, z]).

test('last but one in five-element list', nondet) :- 
	last_but_one(d, [a, b, c, d, e]).

:- end_tests('last but one').
