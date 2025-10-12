-module(roman_numerals).
-export([roman/1]).

roman(N) -> fst(lists:foldl(
   fun({S,M}, {AS, AN}) when AN >= M -> {AS ++ repeat(AN div M, S), AN rem M};
      (_,Acc) -> Acc end,
   {"", N},
   expand([{"M",1000}, {"D",500}, {"C",100}, {"L",50}, {"X",10}, {"V",5}, {"I",1}]))).

fst({A,_}) -> A.

repeat(N,X) -> lists:flatten(lists:duplicate(N, X)).

expand([{X,N10}, {V,N5}, {I,N1}|T]) -> [{X,N10}, {I++X, N10-N1}, {V,N5}, {I++V, N5-N1}] ++ expand([{I,N1}|T]);
expand([{C1,N1}]) -> [{C1,N1}].
