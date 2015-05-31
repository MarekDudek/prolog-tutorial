:- module(flatten_list,[		
]).


%% flatten_list(List?, FlatList?).
%

flatten_list([], []).

/* 
 * Test suite 
 */
:- begin_tests('flatten list').

test('Flattening empty list is no-op') :- 
	flatten_list([], L),
	assertion(L == []).
		
:- end_tests('flatten list').
