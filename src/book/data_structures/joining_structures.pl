:- module(joining_structures,[		
]).

basicpart(rim).
basicpart(spoke).
basicpart(rearframe).
basicpart(handles).
basicpart(gears).
basicpart(bolt).
basicpart(nut).
basicpart(fork).

assembly(bike, [wheel, wheel, frame]).
assembly(wheel, [spoke, rim, hub]).
assembly(frame, [rearframe, frontframe]).
assembly(frontframe, [fork, handles]).
assembly(hub, [gears, axle]).
assembly(axle, [bolt, nut]).



parts_of(BasicPart, [BasicPart]) :-
	basicpart(BasicPart).
parts_of(Assembly, BasicParts) :-
	assembly(Assembly, SubParts),
	parts_of_list(SubParts, BasicParts).
	
parts_of_list([], []).
parts_of_list([H|T], BasicParts) :-
	parts_of(H, HeadParts),
	parts_of_list(T, TailParts),
	append(HeadParts, TailParts, BasicParts).

%% The same with accumulators

parts_of_2(Composite, BasicParts) :-
	parts_of_2(Composite, [], BasicParts).

parts_of_2(BasicPart, Acc, [BasicPart|Acc]) :-
	basicpart(BasicPart).
parts_of_2(Assembly, Acc, BasicParts) :-
	assembly(Assembly, SubParts),
	parts_of_list_2(SubParts, Acc, BasicParts).
	
parts_of_list_2([], Acc, Acc).
parts_of_list_2([H|T], Acc, BasicParts) :-
	parts_of_2(H, Acc, HeadParts),
	parts_of_list_2(T, HeadParts, BasicParts).

%% The same with difference lists

parts_of_3(Composite, BasicParts) :-
	parts_of_3(Composite, BasicParts, Hole),
	Hole = [].
	
parts_of_3(BasicPart, [BasicPart|Hole], Hole) :-
	basicpart(BasicPart).
parts_of_3(Assembly, Parts, Hole) :-
	assembly(Assembly, SubParts),
	parts_of_list_3(SubParts, Parts, Hole).
	
parts_of_list_3([], Hole, Hole).
parts_of_list_3([H|T], Total, Hole) :-
	parts_of_3(H, Total, Hole1),
	parts_of_list_3(T, Hole1, Hole).

:- begin_tests('joining structures').

test('parts of wheel', nondet) :- 
	parts_of(wheel, Parts),
	assertion(Parts == [spoke, rim, gears, bolt, nut]).

test('parts of bike', nondet) :- 
	parts_of(bike, Parts),
	assertion(Parts == 
		[spoke, rim, gears, bolt, nut, 
		 spoke, rim, gears, bolt, nut,
		 rearframe, fork, handles]).

test('acc parts of wheel', nondet) :- 
	parts_of_2(wheel, Parts),
	assertion(Parts == [nut,bolt,gears,rim,spoke]).

test('acc parts of bike', nondet) :- 
	parts_of_2(bike, Parts),
	assertion(Parts == 
		[handles,fork,rearframe,
		 nut,bolt,gears,rim,spoke,
		 nut,bolt,gears,rim,spoke]).
		 
test('diff parts of wheel', nondet) :- 
	parts_of_3(wheel, Parts),
	assertion(Parts == [spoke, rim, gears, bolt, nut]).

test('diff parts of bike', nondet) :- 
	parts_of_3(bike, Parts),
	assertion(Parts == 
		[spoke, rim, gears, bolt, nut, 
		 spoke, rim, gears, bolt, nut,
		 rearframe, fork, handles]).		 

:- end_tests('joining structures').
