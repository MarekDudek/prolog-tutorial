:- begin_tests(likings).
:- use_module(likings).


/* Simple facts */

test(fact_is_true) :-
	likes(laura, flowers).

test(fact_is_not_true, fail) :-
	likes(laura, thomas).


/* Single variable bining */

test(variable_bound_properly) :-
	likes(laura, X),
	X =@= flowers.

test(variable_bound_properly_variant, true(X =@= flowers)) :-
	likes(laura, X).


/* Multiple variables binding */
test(multiple_variables_bound_properly) :-
	likes(X, Y),
	X =@= laura,
	Y =@= flowers.

test(multiple_variables_bound_properly_variant, true(X-Y =@= laura-flowers)) :-
	likes(X, Y).

/* Multiple bindings */
test(multiple_variables_non_deterministic, all(X-Y =@= [laura-flowers, thomas-laura])) :-
	likes(X, Y).


/* Blocked test */

test(blocked_intentionally, blocked(just_to_check_blocking)) :-
	fail.

test(intentionally_broken, fixme(just_to_check_fixme)) :-
	fail.

/* Conditional tests */

test(with_failing_condition, condition(fail)) :-
	format('!!! this should be executed !!!~n'),
	fail.

test(with_fulfilled_condition, condition(true)) :-
	true.

/* Test with setup and teardown */

test(test_with_pre_and_post_actions, [setup(true), cleanup(true)]) :-
	true.

:- end_tests(likings).
