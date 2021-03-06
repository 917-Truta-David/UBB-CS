/*
generatePair(N) = (X, Y),X=between(1, N) AND Y=between(1, X) AND X+Y+N


decmoposeNumber(N)=
      X U decomposeNumber(Y),(X,Y)=generateNumber(N), otherwise


isConsecutive(l1,l2...ln) = true, L=[l1,l2] && l1+1=l2
                            isConsecutive(l2..ln), l1+1=l2 && n>2
                            false, otherwise

nAsSumOfConsecutives(N) = decomposeNumber(N), isConsecutive(decomposeNumber(N))


*/


%equal with the given parameter N.
% generatePair(N - integer, X - integer, Y - integer)
% flow model (i,o,o) (i,i,i)
generatePair(N, X, Y) :-
    between(1, N, Y),
    between(1, Y, X),
    N =:= X + Y.

% This predicate decomposes the given number N into a list of integers
% such that their sum is equal to N.
% decomposeNumber(N - integer, L - list)
% flow model (i,o) (i, i)
decomposeNumber(N, [N]).
decomposeNumber(N, [X|L]) :-
    generatePair(N, X, Y),
    decomposeNumber(Y, L).

% This predicate checks it the that elements in the given list have
% consecutive value.
% isConsecutive(L - list)
% flow model (i)
isConsecutive([X,Y]):-
    X+1=:=Y.
isConsecutive([H1,H2|T]):-
    H2=:=H1+1,
    isConsecutive([H2|T]).

%nAsSumOfConsecutives(N- the number, L - decomposition in sum of cons)
% flow model (i,i) (i,o)
nAsSumOfConsecutives(N,L):-
    decomposeNumber(N,X),
    isConsecutive(X),
    L=X.

sumOfCons(N,L):-findall(R,nAsSumOfConsecutives(N,R),L).
