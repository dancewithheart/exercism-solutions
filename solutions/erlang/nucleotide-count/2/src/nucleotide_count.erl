-module(nucleotide_count).
-export([count/2, nucleotide_counts/1]).
-import(lists, [all/2, member/2, foldl/3, flatten/1]).
-define(EMPTY_STRAND, #{ "A" => 0, "C" => 0, "G" => 0, "T" => 0 }).
-define(VALID_NUCLEOTIDES, flatten(maps:keys(?EMPTY_STRAND))).

count(Strand, Nucleotide) ->
  maps:get(Nucleotide, count2(Strand), 0).

nucleotide_counts(Strand) ->
  case all( fun(C) -> member(C, ?VALID_NUCLEOTIDES) end, Strand) of
    true ->  maps:to_list(count2(Strand));
    false -> erlang:error("oops")
  end.

count2(Strand) -> foldl(
   fun(E,Acc) ->
     PrevCount = maps:get([E], Acc),
     Acc#{[E] => PrevCount + 1}
   end,
   ?EMPTY_STRAND,
   Strand).       

