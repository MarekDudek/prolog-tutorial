:- module(family,[]).

/* Already defined */

father(krzysztof, marek).
mother(lucja, marek).

male(krzysztof).
male(marek).

female(lucja).

parent(X, Y) :-
	father(X, Y) ; mother(X, Y).
	
diff(X, Y) :-
	X \= Y.

/* To be defined */

is_mother(X) :-
	mother(X, _).

/* Tests */

:- begin_tests('family').

test('my father') :-
	parent(krzysztof, marek),
	!.

test('my mother') :-
	parent(lucja, marek).
	
test('differences 1') :-
	diff(krzysztof, marek).
	
test('differences 2') :-
	diff(lucja, marek).
	
test('mother') :-
	is_mother(lucja).
	
test('mother', fail) :-
	is_mother(krzysztof),
	is_mother(marek).

:- end_tests('family').


