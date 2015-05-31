:- module(number_of_elements,[		
]).


%% number_of_elements(N?, List?).
%
%  True if N is number of elements in List.

number_of_elements(0, []).
number_of_elements(N, [_H|T]) :-
	number_of_elements(N1, T),
	N is N1 + 1.

/* 
 * Test suite 
 */
:- begin_tests('number of elements').

test('Number of elements in empty list') :- 
	number_of_elements(N, []),
	assertion(N == 0).

test('Number of elements in multielement list') :- 
	number_of_elements(N, [a, b, c, d, e]),
	assertion(N == 5).

:- end_tests('number of elements').
