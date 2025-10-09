-module(rna_transcription).
-export([to_rna/1]).

-define(Cytosine, $C).
-define(Guanine,  $G).
-define(Adenine,  $A).
-define(Thymine,  $T).
-define(Uracil,   $U).

nucleotide_complement(?Guanine)  -> ?Cytosine;
nucleotide_complement(?Cytosine) -> ?Guanine;
nucleotide_complement(?Thymine)  -> ?Adenine;
nucleotide_complement(?Adenine)  -> ?Uracil;
nucleotide_complement(C)         -> {error, C}.

to_rna(Strand) -> lists:map(fun nucleotide_complement/1, Strand).
