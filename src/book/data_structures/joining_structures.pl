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

:- end_tests('joining structures').
