-module(yacht).
-import(lists, [filter/2, sort/1, sum/1]).
-export([score/2]).

score(D, ones)            -> sumElemsEq(1, D);
score(D, twos)            -> sumElemsEq(2, D);
score(D, threes)          -> sumElemsEq(3, D);
score(D, fours)           -> sumElemsEq(4, D);
score(D, fives)           -> sumElemsEq(5, D);
score(D, sixes)           -> sumElemsEq(6, D);
score(D, little_straight) -> scoreSorted(sort(D), little_straight);
score(D, big_straight)    -> scoreSorted(sort(D), big_straight);
score([A,A,A,A,A], yacht)          -> 50;
score([A,A,A,A,A], four_of_a_kind) -> 4*A;
score(D, four_of_a_kind)  -> scoreFreqencies(frequencies(D), four_of_a_kind);
score(D, full_house)      -> scoreFreqencies(frequencies(D), full_house);
score(D, choice)          -> sum(D);
score(_, _) -> 0.

sumElemsEq(N, XS) -> sum(filter(fun(E) -> E =:= N end, XS)).

scoreSorted([2,3,4,5,6], big_straight) -> 30;
scoreSorted([1,2,3,4,5], little_straight) -> 30;
scoreSorted(_,_) -> 0.

scoreFreqencies([{_,1}, {A,4}], four_of_a_kind) -> 4*A;
scoreFreqencies([{A,4}, {_,1}], four_of_a_kind) -> 4*A;
scoreFreqencies([{B,3}, {A,2}], full_house) -> 2*A + 3*B;
scoreFreqencies([{A,2}, {B,3}], full_house) -> 2*A + 3*B;
scoreFreqencies(_,_) -> 0.

frequencies([]) -> [];
frequencies([H|T]) ->
  CountT = length(filter(fun(E) -> E =:= H end, T)),
  NewT = filter(fun(E) -> E =/= H end, T),
  [{H, 1 + CountT} | frequencies(NewT)].
