:- module(data_structures,[
]).


book(moby_dick, author(herman, melville)).


member(E, [E|_]).
member(E, [_|T]) :- member(E, T).

islist([_H|T]) :- islist(T).
islist([]).

weak_islist([]).
weak_islist([_|_]).

/*
 * Tests
 */

:- begin_tests('data structures').

test('Arithmetic expression is a structure usually written in infix notation') :-
	X = a+b*c,
	Y = +(a,*(b,c)),
	assertion(X == Y).

test('single element list') :-
	L1 = .(a, []),
	L2 = [a],
	assertion(L1 == L2).

test('three-element list') :-
	L1 = .(a, .(b, .(c, []))),
	L2 = [a, b, c],
	assertion(L1 == L2).

test('pattern-matching lists') :-
	[H|T] = [a, b, c],
	assertion(H == a),
	assertion(T == [b, c]).

test('pattern-matching on empty list', fail) :-
	[_H|_T] = [].

test('complicated pattern-matcing') :-
	[_, _, _, [_|T]] = [the, cat, sat, [on, the, mat]],
	assertion(T == [the, mat]).

test('strange case - structure that resembles list but does not end with empty list') :-
	[white|horse] = [P|Q],
	assertion(P == white),
	assertion(Q == horse).

test('member test 1', nondet) :-
	member(a, [a, b, c, d, e]).

test('member test 2', nondet) :-
	member(e, [a, b, c, d, e]).

test('checking if list') :-
	islist([a, b, c, d, e]).
	
test('checking if list, endless loop', 
	[error(resource_error(stack),local), blocked(takes_too_long)]
	) :- 
	islist(_X).
	
test('strage structure isn"t really list', fail) :-
	islist([white|horse]).

test('weak checking if list') :-
	weak_islist([a, b, c, d, e]).

test('weak check won"t detect strange structure') :-
	weak_islist([white|horse]).
	
	
:- end_tests('data structures').
