:- begin_tests(mymodule).
:- use_module(mymodule).

test(mypred) :-
	format('!!! My test running !!!~n'),
	mypred(someVar).

:- end_tests(mymodule).
