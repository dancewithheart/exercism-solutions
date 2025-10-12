-module(roman_numerals).
-export([roman/1]).

roman(0) -> "";
roman(N) when N >= 1000 -> "M" ++ roman(N-1000);
roman(N) when N >= 1000 - 100 -> "CM" ++ roman(N-(1000 - 100));
roman(N) when N >= 500 -> "D" ++ roman(N-500);
roman(N) when N >= 500 - 100 -> "CD" ++ roman(N-(500 - 100));
roman(N) when N >= 100 -> "C" ++ roman(N-100);
roman(N) when N >= 100 - 10 -> "XC" ++ roman(N-(100-10));
roman(N) when N >= 50 -> "L" ++ roman(N-50);
roman(N) when N >= 50 - 10 -> "XL" ++ roman(N-(50-10));
roman(N) when N >= 10 -> "X" ++ roman(N-10);
roman(N) when N >= 10 - 1 -> "IX" ++ roman(N-(10-1));
roman(N) when N >= 5 -> "V" ++ roman(N-5);
roman(N) when N >= 5 - 1 -> "IV" ++ roman(N-(5-1));
roman(N) when N >= 1 -> "I" ++ roman(N-1).
