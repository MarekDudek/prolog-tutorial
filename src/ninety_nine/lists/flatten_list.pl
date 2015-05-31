:- module(flatten_list,[		
]).


%% flatten_list(List?, FlatList?).
%

flatten_list([], []).
flatten_list([H|T], Flat) :-
	is_list(H),
	flatten_list(H, FlatH),
	flatten_list(T, FlatT),
	append(FlatH, FlatT, Flat).
flatten_list([H|T], [H|Flat]) :-
	flatten_list(T, Flat).

/* 
 * Test suite 
 */
:- begin_tests('flatten list').

test('Flattening empty list is no-op', nondet) :- 
	flatten_list([], L),
	assertion(L == []).

test('Flattening list containing empty list', nondet) :- 
	flatten_list([[]], L),
	assertion(L == []).

test('Flattening list containing list containing empty list', nondet) :- 
	flatten_list([[[]]], L),
	assertion(L == []).

test('Flattening list starting with empty list', nondet) :- 
	flatten_list([[], a, b, c], L),
	assertion(L == [a, b, c]).

test('Flattening list starting with single-element list', nondet) :- 
	flatten_list([[a], b, c], L),
	assertion(L == [a, b, c]).

test('Flattening complicated testcase', nondet) :-
	flatten_list([a, [b, [c, d], e]], L),
	assertion(L == [a, b, c, d, e]).
		
:- end_tests('flatten list').
