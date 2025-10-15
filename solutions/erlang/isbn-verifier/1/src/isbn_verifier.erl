-module(isbn_verifier).
-export([is_valid/1]).
-import(lists, [sum/1, map/2, reverse/1, seq/2, zip/2]).

is_valid(Isbn) ->
  X2 = zip([X - $0 || X <- Isbn, is_digit(X) ], reverse(seq(1,10))),
  sum([X * Y || {X,Y} <- X2]) rem 11 == 0.

is_digit(C) -> (C >= $0) andalso (C =< $9).

