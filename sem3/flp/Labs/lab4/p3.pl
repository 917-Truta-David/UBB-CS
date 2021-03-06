/* For a given n, positive, determine all decomposition of n as a sum of consecutive natural numbers.

sumOfCons(n) = SumOfConsAux(n, 1, 1, 0, [])

sumOfConsAux(n, m, nr, s, l1...lk) =
     [], m > n/2 + 1
     SumOfConsAux(n, m, nr+1, s+nr, nr U l1...lk) , s < n
     SumOfConsAux(n, m+1, m+1, 0, []) , s > n
     [nr U l1...lk] U SumOfConsAux(n, m+1, m+1, 0,[]),otherwise(s=n)
*/

%sumOfConsAux(
%    N - the number
%    M - starting index
%    NR - current number
%    S - sum of current decompositon
%    T - current decomposition
%    R - the list of the decompositions
%)
%Flow model : (i,i,i,i,i,i), (i,i,i,i,i,o)
sumOfConsAux(N, M, _, _, _, []):-
    M >= float_integer_part(N/2)+1,!.
sumOfConsAux(N, M, NR, S, T, R):-
    S < N, !,
    NNR is NR+1,
    NS is NR + S,
    sumOfConsAux(N, M, NNR, NS,[NR|T], R).
sumOfConsAux(N, M, _, S, _, R):-
    S > N, !,
    NM is M + 1,
    sumOfConsAux(N, NM, NM, 0, [], R).
sumOfConsAux(N, M, _, S, L, [L|R]):-
    S =:= N, !,
    NM is M + 1,
    sumOfConsAux(N, NM, NM, 0, [], R).


%sumOfCons(N - the number, R- the list of the decompositions)
%flow model: (i,i), (i,o)
sumOfCons(N, R):- sumOfConsAux(N,1,1,0,[],R).


