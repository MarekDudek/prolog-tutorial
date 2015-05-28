:- module(recursive_comparison,[		
]).

fuel_consumed(waster,   [3.1, 10.4, 15.9, 10.3]).
fuel_consumed(guzzler,  [3.2,  9.9, 13.0, 11.6]).
fuel_consumed(prodigal, [2.8,  9.8, 13.1, 10.4]).

equal_or_better_consumption(Good, Bad) :-
	Threshold is (Good + Bad) / 40,
	Worse is Bad + Threshold,
	Good < Worse.


:- begin_tests('recursive comparison').

test('equal or better') :-
	equal_or_better_consumption(10.5, 10).

test('worse', fail) :-
	equal_or_better_consumption(10.52, 10).

test('equal or better 1') :-
	equal_or_better_consumption(10.5, 10.7).
	
test('equal or better 2') :-
	equal_or_better_consumption(10.7, 10.5).

test('equal or better 3') :-
	equal_or_better_consumption(10.1, 10.7).
	
test('equal or better 4', fail) :-
	equal_or_better_consumption(10.7, 10.1).
	
:- end_tests('recursive comparison').
