/* Example program (using example module) */

:- module(myprogram,[
	myprogram/0
]).

:- use_module(mymodule).

myprogram :-
	mypredicate(someVar).
