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
	female(X),
	mother(M, X),
	father(F, X),
	mother(M, Y),
	father(F, Y),
	diff(X, Y).

grandpa_of(Grandpa, Grandson) :-
	male(Grandpa),
	(father(Grandpa, Father) , father(Father, Grandson));
	(father(Grandpa, Mother) , mother(Mother, Grandson)).

sibling(S1, S2) :-
	mother(Mother, S1),
	father(Father, S1),
	mother(Mother, S2),
	father(Father, S2),
	diff(S1, S2).

/* Tests */

:- begin_tests('family').

test('my father', nondet) :-
	parent(krzysztof, marek).

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
	is_mother(krzysztof).

test('mother', fail) :-
	is_mother(marek).

test('father', nondet) :-
	is_father(wiktor),
	is_father(dionizy),
	is_father(krzysztof).

test('father', fail) :-
	is_father(lucja).

test('father', fail) :-
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
	
test('sister', fail) :-
	sister_of(karol, lucja).

test('sister', fail) :-
	sister_of(lucja, lucja).

test('grandpa', nondet) :-
	grandpa_of(wiktor, rafal),
	grandpa_of(antoni, marek).

test('grandpa', fail) :-
	grandpa_of(wiktor, marek).

test('sibling') :-
	sibling(lucja, karol).

test('sibling', fail) :-
	sibling(lucja, lucja).

:- end_tests('family').


