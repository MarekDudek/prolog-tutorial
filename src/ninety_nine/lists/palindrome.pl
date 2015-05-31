:- module(palindrome,[		
]).

:- use_module(reverse_list).


%% palindrome(List?).
%
%  True if List is a palindrome.

palindrome([]).
palindrome([_OnlyElement]).
palindrome(List) :-
	reverse_list(List, Reversed),
	List == Reversed.


/* 
 * Test suite 
 */
:- begin_tests('palindrome').

test('Empty list is palindrome', nondet) :- 
	palindrome([]).
	
test('Single-element list is palindrome', nondet) :- 
	palindrome([single_element]).

test('Proper palindrome is recognised') :-
	palindrome([k,a,y,a,k]).

test('Improper palindrome is not recognised', fail) :-
	palindrome([k,a,y,a,k,x]).
	
:- end_tests('palindrome').