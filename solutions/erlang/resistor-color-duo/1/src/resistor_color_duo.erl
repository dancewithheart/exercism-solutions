-module(resistor_color_duo).
-export([value/1]).

value([C1, C2| _]) ->
  M = #{ black => 0, brown => 1, red => 2, orange => 3, yellow => 4,
         green => 5, blue => 6, violet => 7, grey => 8, white => 9 },
  10 * maps:get(C1, M) + maps:get(C2, M).

