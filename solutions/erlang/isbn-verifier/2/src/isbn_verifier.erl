-module(isbn_verifier).
-export([is_valid/1]).
-import(lists, [sum/1, droplast/1, last/1, reverse/1, seq/2, zip/2]).

is_valid(Isbn) ->
  is_valid_isbn([ X - $0 || X <- Isbn, X /= $- ]).

is_valid_isbn(Isbn) when length(Isbn) /= 10 -> false;
is_valid_isbn(Isbn) ->
  X = case last(Isbn) of
    $X - $0 -> droplast(Isbn) ++ [10]; % replace last X with 10
    _  -> Isbn
  end,
  X2 = zip(X, reverse(seq(1,10))),
  sum([A * B || {A,B} <- X2]) rem 11 == 0.
