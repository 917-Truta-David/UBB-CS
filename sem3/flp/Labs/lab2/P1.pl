/*3.
a. Define a predicate to remove from a list all repetitive elements.
        Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])

Mathematical model:

removeRepMain(l1,l2,...ln)=
      removeRep(l1,l2,..ln,l1,l2,..ln)

removeRep(l1,l2,...,ln, L1,L2,...,Lm) =
      [], n=0
      l1 U removeRep(l2,...,ln,L1,L2,...Lm), nrOcc(l1, L1,...,Ln])=1
      removeRep(l2,...,ln, L1,L2,...Lm), otherwise( > 1 )

nrOcc(e, [l1,l2,...,ln]) =
      0, n=0
      1 + nrOccurences(e,[l2,...,ln]), e = l1
      nrOccurences([l2,...,ln]), otherwise

In Prolog:
*/

%nrOcc(list, element, result)
%flow model (i,i,i), (i,i,o)
nrOcc([],_,0).
nrOcc([H|T],E,N):-
    H=E,
    nrOcc(T,E,N1),
    N is N1+1.
nrOcc([H|T],E,N):-
    H\=E,
    nrOcc(T,E,N).

%removeRep(initial list, copy of the initial list, resulted list)
%flow model (i,i,i), (i,i,o)
removeRep([],_,[]).
removeRep([H|T],LC,[H|R]):-
    nrOcc(LC,H,N),
    N=1,
    removeRep(T,LC,R).
removeRep([H|T],LC,R):-
    nrOcc(LC,H,N),
    N>1,
    removeRep(T,LC,R).

%main
removeRepMain(L,R):-
    removeRep(L,L,R).


/*3.
b. Remove all occurrence of a maximum value from a list on integer numbers.

Mathematical model:

removeMax(l1,l2,...,ln)=
     [], n=0
     l1 U removeMaxRec(l2,...,ln), findMax(l1,l2,...,ln) != l1
     removeMaxRex(l2,...,ln), otherwise

findMax(l1,...,ln)=
     0, n=0
     l1, findMaxRec([l2,...,ln]), l1>findMaxRec(l2,...ln)
     findMaxRec([l2,...,ln]), otherwise

In Prolog:

*/

%findMax(list, result)%
%flow model (i,i), (i,o)
findMax([],-999999).
findMax([H|T], M):-
    findMax(T,M),
    M>=H.
findMax([H|T],M1):-
    findMax(T,M),
    M<H,
    M1 is H.


%removeMax(list,maximum,resulted list)
%flow model (i,i,i), (i,i,o)
removeMax([],_,[]).
removeMax([H|T],M,R):-
    H=M,
    removeMax(T,M,R).
removeMax([H|T],M,[H|R]):-
    H\=M,
    removeMax(T,M,R).


%main
removeMaxMain(L,R):-
    findMax(L,M),
    removeMax(L,M,R).











