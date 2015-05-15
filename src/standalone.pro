:- initialization go.

go :-
	current_prolog_flag(argv, Arguments),
	go(Arguments).

go(Args) :-
	format('Standalone Prolog Program~n'),
	format('~w~n', [Args]),
	halt.
