:- module(closer_look,[
		
]).

owns(john, book).
owns(mary, book).

owns(john, wuthering_heights).
owns(mary, moby_dick).

owns(john, book(wuthering_heights, author(emily, bronte))).

:- begin_tests('closer look').

test('owning', nondet) :-
	owns(john, book).
	
test('matching variables in structure') :-
	owns(john, book(X, author(Y, bronte))),
	assertion(X == wuthering_heights),
	assertion(Y == emily).

:- end_tests('closer look').