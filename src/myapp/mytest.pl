/* Example test of example module and example program */

:- module(mytest,[]).

:- begin_tests('my tests').

:- use_module(mymodule).
:- use_module(myprogram).

test('my predicate') :-
	mypredicate(someVar).
	
test('my program') :-
	myprogram.

:- end_tests('my tests').
