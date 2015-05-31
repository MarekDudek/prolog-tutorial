:- module(reverse_list,[
	reverse_list/2	
]).

%% reverse_list(?List, ?ReversedList).
%
%  True if ReversedList has elements from List in reverse order.

reverse_list([], []).
reverse_list([H|T], Reversed) :-
	reverse_list(T, TailReversed),
	append(TailReversed, [H], Reversed).
	

/* 
 * Test suite 
 */
:- begin_tests('reverse list').

test('Reverse of empty list') :- 
	reverse_list([], L),
	assertion(L == []).
	
test('Reverse of multielement list') :- 
	reverse_list([a, b, c, d, e], L),
	assertion(L == [e, d, c, b, a]).

:- end_tests('reverse list').
