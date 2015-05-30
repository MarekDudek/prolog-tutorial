:- module(recursive_simpler,[		
]).

list(a, [1, 2, 3, 4]).
list(b, [3, 4, 5, 6]).
list(c, [2, 3, 6, 7]).

greater([], []).
greater([H1|T1], [H2|T2]) :-
	H1 > H2,
	greater(T1, T2).

sometimes_greater([H1|_T1], [H2|_T2]) :-
	H1 > H2.
sometimes_greater([_H1|T1], [_H2|T2]) :-
	sometimes_greater(T1, T2).

:- begin_tests('recursive comparisons').

test('b > a') :-
	list(a, A),
	list(b, B),
	greater(B, A).

test('not a > b', fail) :-
	list(a, A),
	list(b, B),
	greater(A, B).
	
test('c > a') :-
	list(a, A),
	list(c, C),
	greater(C, A).
	
test('not c > b', fail) :-
	list(b, B),
	list(c, C),
	greater(C, B).
	
test('b ># a', nondet) :-
	list(a, A),
	list(b, B),
	sometimes_greater(B, A).

test('c ># b', nondet) :-
	list(b, B),
	list(c, C),
	sometimes_greater(C, B).	

test('b ># c', nondet) :-
	list(b, B),
	list(c, C),
	sometimes_greater(B, C).
	
test('not a ># b', [fail]) :-
	list(a, A),
	list(b, B),
	sometimes_greater(A, B).
	
:- end_tests('recursive comparisons').
