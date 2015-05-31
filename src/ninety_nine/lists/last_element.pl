:- module(last_element,[		
]).


%% last_element(?Elem, ?List).
%
%  True if Elem is the last element of List.

last_element(Elem, [Elem]).
last_element(Elem, [_H|T]) :-
	last_element(Elem, T).

/* 
 * Test suite 
 */
:- begin_tests('last element').

test('Last element of empty list', fail) :-
	last_element(y, []).
	
test('Last element of one-element list', nondet) :- 
  	last_element(E, [e]),
  	assertion(E == e).

test('Last element of multi-element list', nondet) :- 
  	last_element(E, [a, b, c, d, e]),
  	assertion(E == e).

:- end_tests('last element').
