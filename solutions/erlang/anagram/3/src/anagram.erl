-module(anagram).
-export([find_anagrams/2]).
-import(string, [to_upper/1]).

find_anagrams(S, Cs) ->
  [C || C <- Cs, is_anagram(to_upper(S), to_upper(C)) ].

is_anagram(S, S) -> false;
is_anagram(S, C) -> lists:sort(S) == lists:sort(C).
    
