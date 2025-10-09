-module(rna_transcription).

-export([to_rna/1]).

-define(Cytosine, $C).
-define(Guanine,  $G).
-define(Adenine,  $A).
-define(Thymine,  $T).
-define(Uracil,   $U).

nucleotide_complement(C) when C =:= ?Guanine -> ?Cytosine;
nucleotide_complement(C) when C =:= ?Cytosine -> ?Guanine;
nucleotide_complement(C) when C =:= ?Thymine -> ?Adenine;
nucleotide_complement(C) when C =:= ?Adenine -> ?Uracil;
nucleotide_complement(C) -> {error, C}.

to_rna(Strand) -> lists:map(fun nucleotide_complement/1, Strand).
