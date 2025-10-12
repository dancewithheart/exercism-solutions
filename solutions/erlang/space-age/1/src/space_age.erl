-module(space_age).
-export([age/2]).

age(earth, Sec) -> Sec / 31557600;
age(mercury, Sec) -> age(earth, Sec) / 0.2408467;
age(venus, Sec) -> age(earth, Sec) / 0.61519726;
age(mars, Sec) -> age(earth, Sec) / 1.8808158;
age(jupiter, Sec) -> age(earth, Sec) / 11.862615;
age(saturn, Sec) -> age(earth, Sec) / 29.447498;
age(uranus, Sec) -> age(earth, Sec) / 84.016846;
age(neptune, Sec) -> age(earth, Sec) / 164.79132.
