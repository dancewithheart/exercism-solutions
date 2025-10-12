-module(yacht).
-import(lists, [filter/2, map/2, sort/1, sum/1]).
-export([score/2, frequencies/1]).

score(D, yacht) ->
  F = frequencies(D),
  case length(F) of
    1 -> 50;
    _ -> 0
  end;
score(D, ones)   -> sumElemsEq(1, D);
score(D, twos)   -> sumElemsEq(2, D);
score(D, threes) -> sumElemsEq(3, D);
score(D, fours)  -> sumElemsEq(4, D);
score(D, fives)  -> sumElemsEq(5, D);
score(D, sixes)  -> sumElemsEq(6, D);
score(D, four_of_a_kind) ->
  F = frequencies(D),
  case (filter(fun ({_,FR}) -> (FR == 4) or (FR == 5) end, F)) of
    [{N,4}] -> 4*N;
    [{N,5}] -> 4*N;
    _ -> 0
  end;
score(D, little_straight) ->
  case sort(D) of
    [1,2,3,4,5] -> 30;
    _ -> 0
  end;
score(D, big_straight) ->
  case sort(D) of
    [2,3,4,5,6] -> 30;
    _ -> 0
  end;
score(D, full_house) ->
  F = frequencies(D),
  case sort(map(fun snd/1, F)) of
    [2,3] -> sum(D);
    _ -> 0
  end;
score(Dice, choice) -> sum(Dice).

frequencies([]) -> [];
frequencies([H|T]) ->
  CountT = length(filter(fun(E) -> E =:= H end, T)),
  NewT = filter(fun(E) -> E =/= H end, T),
  [{H, 1 + CountT} | frequencies(NewT)].

sumElemsEq(N, XS) -> sum(filter(fun(E) -> E =:= N end, XS)).

snd({_,S}) -> S.
