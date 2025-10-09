-module(scrabble_score).
-export([score/1]).
-import(string, [lowercase/1]).
-define(otherwise, true).

score(Word) ->
  M = new_score_map(),
  lists:sum(lists:map(fun(C) -> scoreChar(C, M) end, lowercase(Word))).

new_score_map() ->
  lists:foldl(
    fun({Ch, N}, Acc) ->
      maps:merge(map_scores(Ch, N), Acc)
    end,
    #{},
    [{"aeioulnrst",1}, {"dg",2}, {"bcmp",3},
     {"fhvwy",4}, {"k",5}, {"jx", 8}, {"qz", 10}]).

map_scores(L, N) -> maps:from_list(zip_with_const(L, N)). 
zip_with_const(L, N) -> lists:map(fun(E) -> {E,N} end, L).

scoreChar(C, M) -> maps:get(C, M, 0).

