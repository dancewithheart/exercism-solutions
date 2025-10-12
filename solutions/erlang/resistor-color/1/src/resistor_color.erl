-module(resistor_color).

-export([colors/0, color_code/1]).

colors() ->
  [black, brown, red, orange, yellow,
   green, blue, violet, grey, white].

color_code(C) -> find_index(C, colors(), 0).

find_index(E, [E|_], Acc) -> Acc;
find_index(E, [_|T], Acc) -> find_index(E, T, Acc + 1).
    
