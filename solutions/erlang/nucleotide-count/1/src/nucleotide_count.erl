-module(nucleotide_count).
-export([count/2, nucleotide_counts/1]).
-define(EMPTY_STRAND, #{ "A" => 0, "C" => 0, "G" => 0, "T" => 0 }).


count(Strand, Nucleotide) ->
  maps:get(Nucleotide, count2(Strand), 0).

nucleotide_counts(Strand) ->
  case lists:all(fun(C) -> lists:member(C, "ACGT") end, Strand) of
    true ->  maps:to_list(count2(Strand));
    false -> erlang:error("woho")
  end.

count2(Strand) -> lists:foldl(fun(E,Acc) ->
     N = maps:get([E], Acc) + 1,
     Acc#{[E] => N}
   end,
   ?EMPTY_STRAND,
   Strand).       

