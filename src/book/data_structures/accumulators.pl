:- module(accumulators,[		
]).

%% list_length(?List, ?Length)
% 
% Is true when Length is the number of elements in the List.

list_length([], 0).
list_length([_H|T], Length) :-
	list_length(T, Len),
	Length is 1 + Len.
	
%% list_length2(?List, ?Length)
%
%  Like list_length but more effective because it uses accumulator.
%
%  @see list_length/2

fast_list_length(List, Length) :- 
  fast_list_length(List, 0, Length).

fast_list_length([], Acc, Acc).
fast_list_length([_H|T], Acc, Length) :-
	Len is Acc + 1,
	fast_list_length(T, Len, Length).	

/* Test suite */

:- begin_tests('accumulators').

test('length of empty list') :- 
	list_length([], 0).

test('length of one-element list') :-
	list_length([one], 1).

test('length of five-element list') :-
	list_length([one, two, three, four, five], 5).
	

test('fast length of empty list') :- 
	fast_list_length([], 0).
	
test('length of one-element list') :-
	fast_list_length([one], 1).

test('length of five-element list') :-
	fast_list_length([one, two, three, four, five], 5).


:- end_tests('accumulators').
