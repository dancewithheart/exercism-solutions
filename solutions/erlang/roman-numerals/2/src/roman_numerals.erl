-module(roman_numerals).

-export([roman/1]).

roman(N) -> roman(N, "", [{"M", 1000}, {"CM", 900}, {"D", 500}, {"CD", 400}, {"C", 100},
  {"XC", 90}, {"L", 50}, {"XL", 40}, {"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]).

roman(0, Acc, _) -> Acc;
roman(N, Acc, Xs = [{S,M}|_]) when N >= M -> roman(N-M, Acc ++ S, Xs);
roman(N, Acc, [{_,M}|T]) when N < M -> roman(N, Acc, T).
