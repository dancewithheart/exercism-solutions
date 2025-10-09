-module(pangram).
-export([is_pangram/1]).
-define(ALL_LETTERS, "abcdefghijklmnopqrstuvwxyz").

is_pangram(S) ->
  S2 = string:lowercase(S),
  lists:all(fun(C) -> lists:member(C, S2) end, ?ALL_LETTERS).

