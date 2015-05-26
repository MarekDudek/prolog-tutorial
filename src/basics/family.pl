:- module(family,[]).

/* Already defined */

father(wiktor, dionizy).
father(dionizy, rafal).
father(krzysztof, marek).
father(rafal, rafals_daughter).

father(antoni, karol).
father(antoni, henryk).
father(antoni, lucja).

mother(daniela, krzysztof).
mother(teresa, rafal).
mother(lucja, marek).

mother(stefania, karol).
mother(stefania, henryk).
mother(stefania, lucja).

male(wiktor).
male(dionizy).
male(krzysztof).
male(rafal).
male(marek).

female(daniela).
female(teresa).
female(lucja).

parent(X, Y) :-
	father(X, Y) ; mother(X, Y).
	
diff(X, Y) :-
	X \= Y.

/* To be defined */

is_mother(X) :-
	mother(X, _).
	
is_father(X) :-
	father(X, _).

is_son(X) :-
	(mother(_, X) ; father(_, X)),
	male(X).
	
sister_of(X, Y) :-
	mother(M, X),
	mother(M, Y),
	father(F, X),
	father(F, Y).

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
	
test('mother', nondet) :-
	is_mother(daniela),
	is_mother(lucja),
	is_mother(teresa).
	
test('mother', fail) :-
	is_mother(krzysztof),
	is_mother(marek).
	
test('father', nondet) :-
	is_father(wiktor),
	is_father(dionizy),
	is_father(krzysztof).
	
test('father', fail) :-
	is_father(lucja),
	is_father(marek).
	
test('son', nondet) :-
	is_son(dionizy),
	is_son(krzysztof),
	is_son(rafal),
	is_son(marek).

test('son', fail) :-
	is_son(rafals_daughter).
	
test('sister') :-
	sister_of(lucja, karol),
	sister_of(lucja, henryk).
	
:- end_tests('family').


