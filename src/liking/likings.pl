:- module(likings,[
	likes/2,
	pair/2		
]).

likes(laura, flowers).
likes(thomas, laura).

pair(X, Y) :-
	likes(X, Y), likes(Y, X).