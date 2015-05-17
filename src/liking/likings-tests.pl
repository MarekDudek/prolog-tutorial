:- begin_tests(likings).
:- use_module(likings).


/* Simple facts */

test(fact_is_true) :-
	likes(laura, flowers).

test(fact_is_not_true, [fail]) :-
	likes(laura, thomas).


/* Single variable bining */

test(variable_bound_properly) :-
	likes(laura, X),
	X =@= flowers.

test(variable_bound_properly_variant, [true( X =@= flowers)]) :-
	likes(laura, X).


/* Multiple variables binding */
test(multiple_variables_bound_properly) :-
	likes(X, Y),
	X =@= laura,
	Y =@= flowers.

test(multiple_variables_bound_properly_variant, [true( X-Y =@= laura-flowers )]) :-
	likes(X, Y).

/* Multiple bindings */
test(multiple_variables_non_deterministic, all(X-Y =@= [laura-flowers, thomas-laura])) :-
	likes(X, Y).


:- end_tests(likings).
