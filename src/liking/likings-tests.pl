:- begin_tests(likings).
:- use_module(likings).


/* Simple fact. */
test(wtf) :-
	likes(laura, flowers).

/* Untrue condition. */
test(wtf, [fail]) :-
	likes(laura, thomas).


:- end_tests(likings).
