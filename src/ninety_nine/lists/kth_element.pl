:- module(kth_element,[		
]).

%% element_at(?Elem, ?List, ?K).
%
%  True if Elem occurs at position K in List. Count starts at 1.

element_at(H, [H|_T], 1). 
element_at(Elem, [_H|T], K) :-
	K1 is K - 1,
	element_at(Elem, T, K1).


/* 
 * Test suite 
 */
:- begin_tests('k-th element').

test('1-st element of empty list', fail) :- 
	element_at(_, [], 1).

test('3-rd element of empty list', fail) :- 
	element_at(_, [], 3).
	
test('1-st element of the list', nondet) :- 
	element_at(E, [a, b, c], 1),
	assertion(E == a).

test('3-rd element of the list', nondet) :- 
	element_at(E, [a, b, c, d, e], 3),
	assertion(E == c).
	
:- end_tests('k-th element').
