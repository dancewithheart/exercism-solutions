-module(allergies).

-export([allergies/1, is_allergic_to/2]).

allergies(Score) when Score >= 512 -> allergies(Score rem 512);
allergies(Score) when Score >= 256 -> allergies(Score rem 256);
allergies(Score) when Score >= 128 -> allergies(Score rem 128) ++ [cats];
allergies(Score) when Score >= 64 -> allergies(Score - 64) ++ [pollen];
allergies(Score) when Score >= 32 -> allergies(Score - 32) ++ [chocolate];
allergies(Score) when Score >= 16 -> allergies(Score - 16) ++ [tomatoes];
allergies(Score) when Score >= 8 -> allergies(Score - 8) ++ [strawberries];
allergies(Score) when Score >= 4 -> allergies(Score - 4) ++ [shellfish];
allergies(Score) when Score >= 2 -> allergies(Score - 2) ++ [peanuts];
allergies(Score) when Score >= 1 -> [eggs];
allergies(_) -> [].

is_allergic_to(Substance, Score) -> lists:member(Substance, allergies(Score)).
