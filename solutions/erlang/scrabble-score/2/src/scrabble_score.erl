-module(scrabble_score).
-export([score/1]).
-import(string, [lowercase/1]).
-import(lists, [map/2, foldl/3, sum/1]).
-define(otherwise, true).

score(Word) ->
  Scores = scores_map(),
  PrepW = lowercase(Word),
  sum(map(fun(C) -> score_letter(C, Scores) end, PrepW)).

scores_map() -> foldl(
  fun({Cs, N}, Acc) ->
    maps:merge(scores_map(Cs, N), Acc)
  end,
  #{},
  [{"aeioulnrst",1}, {"dg",2}, {"bcmp",3}, {"fhvwy",4}, {"k",5},
   {"jx",8}, {"qz",10}]).

scores_map(Cs, N) -> maps:from_list([{C,N} || C <- Cs]).

score_letter(C, M) -> maps:get(C, M, 0).

