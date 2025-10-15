-module(anagram).
-export([find_anagrams/2]).

find_anagrams(Subject, Candidates) ->
  lists:filter(fun(C) -> is_anagram(Subject,C) end, Candidates).

is_anagram(S, C) ->
  S1 = string:to_upper(S),
  S2 = lists:sort(S1),
  C1 = string:to_upper(C),
  C2 = lists:sort(C1),
  S1 /= C1 andalso S2 == C2.
    
