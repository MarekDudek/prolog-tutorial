:- module(sentences,[		
]).

change(you, i).
change(are, [am, not]).
change(french, german).
change(do, no).
change(X, X).

alter_sentence([], []).
alter_sentence([H1|T1], [H2|T2]) :-
	change(H1, H2), alter_sentence(T1, T2).

:- begin_tests('altering sentences').

test('do you know french?', nondet) :-
	alter_sentence([do, you, know, french], X),
	assertion(X == [no, i, know, german]).

test('you are a computer', nondet) :-
	alter_sentence([you, are, a, computer], X),
	assertion(X == [i, [am, not], a, computer]).
	
:- end_tests('altering sentences').
