-module(protein_translation).

-export([proteins/1]).
-define(AMINO_ACIDS_CODONS, #{
  "AUG" => methionine,
  "UUU" => phenylalanine,
  "UUC" => phenylalanine,
  "UUA" => leucine,
  "UUG" => leucine,
  "UCU" => serine,
  "UCC" => serine,
  "UCA" => serine,
  "UCG" => serine,
  "UAU" => tyrosine,
  "UAC" => tyrosine,
  "UGG" => tryptophan,
  "UGU" => cysteine,
  "UGC" => cysteine,
  "UAA" => stop,
  "UAG" => stop,
  "UGA" => stop
}).

proteins([]) -> {ok, []};
proteins([A,B,C|T]) ->
  X = maps:find([A,B,C], ?AMINO_ACIDS_CODONS),
  case X of
    error ->      {error, badarg};
    {ok, stop} -> {ok, []}; 
    {ok, P} ->
      case proteins(T) of
	{ok, Ps} -> {ok, [P|Ps]};
        error -> {error, badarg};
        {error, badarg} -> {error, badarg}
      end
  end;
proteins([_|_]) -> {error, badarg}.

