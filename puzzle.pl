solve(X,X,[]).
solve(X,X,_).
solve(I,G,[P|T]):-
	move(I,C,M),
	P = M,
	solve(C,G,T).
%woohoo
solve1(X,Y,P) :- 
	append(P,_,_),solve(X,Y,P), !. 
%woohoo

%This section will handle defining the goal state, the possible moves that the 
%0 position can move to given a particular board state, as well as the manhattan

%This list represents the possible moves that the 0 can 
%appear to be making. There are 6 different possible ways that the 
%0 can appear to be moving based on its current position
%in the matrix, and thus must be represented as goals


%Possible left moves for the 0 position
left( A/0/C/D/E/F/H/I/J , 0/A/C/D/E/F/H/I/J ).
left( A/B/C/D/0/F/H/I/J , A/B/C/0/D/F/H/I/J ).
left( A/B/C/D/E/F/H/0/J , A/B/C/D/E/F/0/H/J ).
left( A/B/0/D/E/F/H/I/J , A/0/B/D/E/F/H/I/J ).
left( A/B/C/D/E/0/H/I/J , A/B/C/D/0/E/H/I/J ).
left( A/B/C/D/E/F/H/I/0 , A/B/C/D/E/F/H/0/I ).

%Possible right moves for the 0 position
right( A/0/C/D/E/F/H/I/J , A/C/0/D/E/F/H/I/J ).
right( A/B/C/D/0/F/H/I/J , A/B/C/D/F/0/H/I/J ).
right( A/B/C/D/E/F/H/0/J , A/B/C/D/E/F/H/J/0 ).
right( 0/B/C/D/E/F/H/I/J , B/0/C/D/E/F/H/I/J ).
right( A/B/C/0/E/F/H/I/J , A/B/C/E/0/F/H/I/J ).
right( A/B/C/D/E/F/0/I/J , A/B/C/D/E/F/I/0/J ).

%Posssible up moves for the 0 position
up( A/B/C/0/E/F/H/I/J , 0/B/C/A/E/F/H/I/J ).
up( A/B/C/D/0/F/H/I/J , A/0/C/D/B/F/H/I/J ).
up( A/B/C/D/E/0/H/I/J , A/B/0/D/E/C/H/I/J ).
up( A/B/C/D/E/F/0/I/J , A/B/C/0/E/F/D/I/J ).
up( A/B/C/D/E/F/H/0/J , A/B/C/D/0/F/H/E/J ).
up( A/B/C/D/E/F/H/I/0 , A/B/C/D/E/0/H/I/F ).

%Possible down moves for the 0 psosition
down( A/B/C/0/E/F/H/I/J , A/B/C/H/E/F/0/I/J ).
down( A/B/C/D/0/F/H/I/J , A/B/C/D/I/F/H/0/J ).
down( A/B/C/D/E/0/H/I/J , A/B/C/D/E/J/H/I/0 ).
down( 0/B/C/D/E/F/H/I/J , D/B/C/0/E/F/H/I/J ).
down( A/0/C/D/E/F/H/I/J , A/E/C/D/0/F/H/I/J ).
down( A/B/0/D/E/F/H/I/J , A/B/F/D/E/0/H/I/J ).

%%% this section defines what happens when a particular move occurs 
%these goals are necessary to generate next board states for the program to be considering,
%as each of the moves will generate 
move(P,C,l) :-  left(P,C).
move(P,C,u) :-  up(P,C).
move(P,C,r) :-  right(P,C).
move(P,C,d) :-  down(P,C).
