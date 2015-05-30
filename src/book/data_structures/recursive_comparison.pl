:- module(recursive_comparison,[		
]).

fuel_consumed(waster,   [3.1, 10.4, 15.9, 10.3]).
fuel_consumed(guzzler,  [3.2,  9.9, 13.0, 11.6]).
fuel_consumed(prodigal, [2.8,  9.8, 13.1, 10.4]).

equal_or_better_consumption(Good, Bad) :-
	Threshold is (Good + Bad) / 40,
	Worse is Bad + Threshold,
	Good < Worse.

always_better_or_equal_car(Car1, Car2) :-
	fuel_consumed(Car1, Fuel1),
	fuel_consumed(Car2, Fuel2),
	Car1 \= Car2,
	always_equal_or_better_consunption(Fuel1, Fuel2).
	
always_equal_or_better_consunption([], []).
always_equal_or_better_consunption([H1|T1], [H2|T2]) :-
	equal_or_better_consumption(H1, H2),
	always_equal_or_better_consunption(T1, T2).
	
sometimes_better_consumption([H1|_], [H2|_]) :-
	equal_or_better_consumption(H1, H2).
sometimes_better_consumption([_|T1], [_|T2]) :-
	sometimes_better_consumption(T1, T2).

sometimes_better_or_equal_car(Car1, Car2) :-
	fuel_consumed(Car1, Fuel1),
	fuel_consumed(Car2, Fuel2),
	Car1 \= Car2,
	sometimes_better_consumption(Fuel1, Fuel2).
	
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
	
test('prodigal better than waster and guzzler') :-
	always_better_or_equal_car(prodigal, waster),
	always_better_or_equal_car(prodigal, guzzler).
	
test('waster no better than guzzler', fail) :-
	always_better_or_equal_car(waster, guzzler).

test('guzzler no better than waster', fail) :-
	always_better_or_equal_car(guzzler, waster).
	
test('even waster sometimes better than prodigal', nondet) :-
	sometimes_better_or_equal_car(waster, prodigal).
	
:- end_tests('recursive comparison').
