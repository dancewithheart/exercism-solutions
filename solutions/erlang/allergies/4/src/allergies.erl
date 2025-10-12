-module(allergies).
-export([allergies/1, is_allergic_to/2]).
-import(lists, [foldl/3, member/2]).
-define(ALLERGENS, #{ cats => 128, pollen => 64, chocolate => 32, tomatoes => 16,
    strawberries => 8, shellfish => 4, peanuts => 2, eggs => 1}).

-spec(allergies(integer()) -> list(atom())).
allergies(Score) -> [ A || A := N <- ?ALLERGENS, Score band N > 0 ].

-spec(is_allergic_to(atom(), integer()) -> boolean()).
is_allergic_to(Substance, Score) -> member(Substance, allergies(Score)).
