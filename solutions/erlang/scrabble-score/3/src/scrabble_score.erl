-module(scrabble_score).
-export([score/1]).
-import(string, [lowercase/1]).
-import(lists, [map/2, foldl/3, sum/1]).
-define(otherwise, true).

score(Word) ->
  ScoreMap = scores_map(),
  PrepW = lowercase(Word),
  foldl(
    fun(L, Score) -> Score + score_letter(L, ScoreMap) end, 0, PrepW).

scores_map() -> foldl(
  fun add_scores/2,
  #{},
  [{"aeioulnrst",1}, {"dg",2}, {"bcmp",3}, {"fhvwy",4}, {"k",5},
   {"jx",8}, {"qz",10}]).

add_scores({Cs, N}, M) -> foldl(fun(C,Acc) -> Acc#{ C => N} end, M, Cs).

score_letter(L, ScoreMap) -> maps:get(L, ScoreMap, 0).

