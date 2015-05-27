:- module(family,[]).

/* Already defined */

father(wiktor, dionizy).
father(dionizy, rafal).
father(krzysztof, marek).
father(rafal, rafals_daughter).

father(antoni, karol).
father(antoni, henryk).
father(antoni, lucja).

father(henryk, marcin).
father(henryk, andrzej).

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

male(antoni).
male(karol).
male(henryk).

female(daniela).
female(teresa).
female(lucja).

parent(Parent, Child) :-
	father(Parent, Child) ; mother(Parent, Child).

diff(X, Y) :-
	X \= Y.

/* To be defined */

is_mother(Mother) :-
	mother(Mother, _Child).

is_father(Father) :-
	father(Father, _Child).

is_son(Son) :-
	parent(_Parent, Son),
	male(Son).

sister_of(Sister, Sibling) :-
	parent(Parent, Sister),
	parent(Parent, Sibling),
	female(Sister),
	diff(Sister, Sibling).

grandpa_of(Gpa, Gson) :-
	father(Gpa, Parent),
	parent(Parent, Gson).
	
sibling(Sibling1, Sibling2) :-
	parent(Parent, Sibling1),
	parent(Parent, Sibling2),
	diff(Sibling1, Sibling2).
	
aunt(Aunt, X) :-
	female(Aunt),
	sibling(Aunt, Parent),
	parent(Parent, X).

uncle(Uncle, X) :-
	male(Uncle),
	sibling(Uncle, Parent),
	parent(Parent, X).

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

test('sister', nondet) :-
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

test('sibling', nondet) :-
	sibling(lucja, karol).

test('sibling', fail) :-
	sibling(lucja, lucja).
	
test('aunt', nondet) :-
	aunt(lucja, marcin).

test('uncle', nondet) :-
	uncle(karol, marek).

:- end_tests('family').


