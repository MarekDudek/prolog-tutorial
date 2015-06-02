:- module(pack_cons_dups,[
]).


%% pack_cons_dups(Duplicates?, ListOfLists?).
 
pack_cons_dups([], []).
pack_cons_dups([A], [[A]]).
pack_cons_dups([A, A], [[A, A]]).
pack_cons_dups([A, B], [[A], [B]]).



/* 
 * Test suite 
 */
:- begin_tests('pack consecutive duplicates').

test('Empty list') :-
	pack_cons_dups([], L),
	assertion(L == []).

test('Singleton list', nondet) :-
	pack_cons_dups([a], L),
	assertion(L == [[a]]).

test('Two equal elements list', nondet) :-
	pack_cons_dups([a, a], L),
	assertion(L == [[a, a]]).

test('Two different elements list', nondet) :-
	pack_cons_dups([a, b], L),
	assertion(L == [[a], [b]]).



test('matching head') :-
	L = [elem],
	L = [H | T],
	H = elem,
	T = [].
	
test('match embedded head') :-
	L = [[a], [b]],
	L = [[A] | T],
	A = a,
	T = [[b]].
		
:- end_tests('pack consecutive duplicates').
