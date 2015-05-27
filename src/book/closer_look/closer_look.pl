:- module(closer_look,[
		
]).

owns(john, book).
owns(mary, book).

owns(john, wuthering_heights).
owns(mary, moby_dick).

owns(john, book(wuthering_heights, author(emily, bronte))).

/* 
 * Test suite 
 */

:- begin_tests('closer look').

test('owning', nondet) :-
	owns(john, book).
	
test('matching variables in structure') :-
	owns(john, book(X, author(Y, bronte))),
	assertion(X == wuthering_heights),
	assertion(Y == emily).
	
test('operators do not carry out math', fail) :-
	3 + 4 == 7.
	
test('carry out math') :-
	7 is 3 + 4.


:- end_tests('closer look').