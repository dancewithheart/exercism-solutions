-module(roman_numerals).
-export([roman/1]).

roman(N) -> roman(N, "", [{"M", 1000}, {"CM", 900}, {"D", 500}, {"CD", 400}, {"C", 100},
  {"XC", 90}, {"L", 50}, {"XL", 40}, {"X", 10}, {"IX", 9}, {"V", 5}, {"IV", 4}, {"I", 1}]).

roman(0, Acc, _) -> Acc;
roman(N, Acc, [{S,M}|T]) when N >= M -> roman(N rem M, Acc ++ repeat(N div M, S), T);
roman(N, Acc, [_|T]) -> roman(N, Acc, T).

repeat(N,X) -> lists:flatten(lists:duplicate(N, X)).
