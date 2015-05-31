:- module(elim_cons_dups,[		
]).


%% elim_cons_dups(Duplicates?, NoDuplicates?).

elim_cons_dups([], []).
elim_cons_dups([E], [E]).
elim_cons_dups([H, H | T], NoDups) :-
	elim_cons_dups([H | T], NoDups).
elim_cons_dups([H1, H2 | T],[H1 | NoDups]) :-
	elim_cons_dups([H2 | T], NoDups).
	

/* 
 * Test suite 
 */
:- begin_tests('eliminate consecutive duplicates').

test('Empty list') :-
	elim_cons_dups([], L),
	assertion(L == []).

test('Single element list', nondet) :-
	elim_cons_dups([e], L),
	assertion(L == [e]).
	
test('Complex case', nondet) :-
	elim_cons_dups([a, a, a, a, b, c, c, a, a, d, e, e, e, e], L),
	assertion(L == [a,b,c,a,d,e]).
	
	
:- end_tests('eliminate consecutive duplicates').
