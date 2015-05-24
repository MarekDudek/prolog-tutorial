
main :-
	current_prolog_flag(argv, Arguments),
	main(Arguments).

main(Args) :-
	format('Standalone Prolog Program~n'),
	format('~w~n', [Args]).
