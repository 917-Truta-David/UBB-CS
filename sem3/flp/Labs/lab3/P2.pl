/*
1.
a. Sort a list with removing the double values.
E.g.: [4 2 6 2 3 4] --> [2 3 4 6]

nrOcc(e, [l1,l2,...,ln]) =
      0, n=0
      1 + nrOccurences(e,[l2,...,ln]), e = l1
      nrOccurences([l2,...,ln]), otherwise

removeDouble(l1,l2...ln)=
      [], n=0
      l1 U removeDouble(l2...ln), nrOcc(l1, l2...ln) = 0
      removeDouble(l2...ln), otherwise

insertSort(l1...ln)=
      iSort(l1...ln, [])

iSort(l1...ln, L1...Ln) =
      [], n=0
      iSort(l2...ln, insert(l1, L1...Ln)), otherwise


insert(e, l1...ln) =
      e, n=0
      l1 U insert(l2...ln), e > l1
      e U l1 U insert(l2...), otherwise (e <= l1)


sortRemoveDouble(l1...ln) = insertSort(removeDouble(l1...ln, l1...ln))


*/

%nrOcc(list, element, result)
%flow model (i,i,i), (i,i,o)
nrOcc([],_,0).
nrOcc([H|T],E,N):-
    H=E, !,
    nrOcc(T,E,N1),
    N is N1+1.
nrOcc([_|T],E,N):-
    nrOcc(T,E,N).

%removeDouble(list, result)
%flow model(i,i), (i,o)
removeDouble([], []).
removeDouble([H|T], [H|R]):-
    nrOcc(T, H, N),
    N = 0,!,
    removeDouble(T,R).
removeDouble([_|T], R):-
    removeDouble(T,R).


%insertSort(list, result)
%flow model(i,i), (i,o)
insertSort(List,Sorted):-
    iSort(List,[],Sorted).

%iSort(list, acumulator, result)
%flow model (i,i,o), (i,i,i)
iSort([],Acc,Acc).
iSort([H|T],Acc,Sorted):-
    insert(H,Acc,NAcc),
    iSort(T,NAcc,Sorted).

%insert (element, list, result)
%flow model (i,i,o), (i,i,i)
insert(X,[Y|T],[Y|NT]):-
    X>Y,
    insert(X,T,NT).
insert(X,[Y|T],[X,Y|T]):-
    X=<Y.
insert(X,[],[X]).


%sortRemoveDouble(list, result)
%flow model (i,i), (i,o)
sortRemoveDouble(L, R2):-
    removeDouble(L, R),
    insertSort(R, R2).

/*
1.
b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every
sublist with removing the doubles.
Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, 2, [1, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1], 7].


sortRemoveSublist(l1,l2...ln) =
    [], n=0
    sortRemoveSublist(sortRemoveDouble(l1))
                            U sortRemoveSublist(l2...ln), l1 is a list
    l1 U sortRemoveSublist(l2,...ln), otherwise

*/

%sortRemoveSublist(list, result)
%flow model (i,i) (i,o)
sortRemoveSublist([], []).
sortRemoveSublist([H|T], [R|R2]):-
    is_list(H), !,
    sortRemoveDouble(H, R),
    sortRemoveSublist(T, R2).
sortRemoveSublist([H|T], [H|R]):-
    sortRemoveSublist(T, R).




