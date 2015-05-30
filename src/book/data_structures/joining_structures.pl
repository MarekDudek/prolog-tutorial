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


partsof(Part, [Part]) :-
	basicpart(Part).
partsof(Part, BasicParts) :-
	assembly(Part, Subparts),
	partsoflist(Subparts, BasicParts).
	
partsoflist([], []).
partsoflist([H|T], Total) :-
	partsof(H, HeadParts),
	partsoflist(T, Tailparts),
	append(HeadParts, Tailparts, Total).

:- begin_tests('joining structures').

test('parts of wheel', nondet) :- 
	partsof(wheel, Parts),
	assertion(Parts == [spoke, rim, gears, bolt, nut]).

test('parts of bike', nondet) :- 
	partsof(bike, Parts),
	assertion(Parts == 
		[spoke, rim, gears, bolt, nut, 
		 spoke, rim, gears, bolt, nut,
		 rearframe, fork, handles]).

:- end_tests('joining structures').
