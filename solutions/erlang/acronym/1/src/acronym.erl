-module(acronym).
-import(string, [tokens/2, to_upper/1]).
-import(lists, [map/2]).
-export([abbreviate/1]).

head([])    -> {error, "head on empty list"};
head([H|_]) -> H.

abbreviate(Phrase) ->
  to_upper(
    map(
      fun head/1,
      tokens(Phrase, " -_"))).
