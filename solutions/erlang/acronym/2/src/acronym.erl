-module(acronym).
-import(string, [tokens/2, to_upper/1]).
-import(lists, [map/2]).
-export([abbreviate/1]).

-spec abbreviate(string()) -> string().
abbreviate(Phrase) ->
  to_upper(
    map(
      fun hd/1,
      tokens(Phrase, " -_"))).
