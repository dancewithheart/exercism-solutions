% Define the 'chatty' fact
chatty(gustavo).
chatty(valeria).

% Define the 'likes' fact
likes(esteban, malena).
likes(malena, esteban).
likes(gustavo, valeria).

% Define the 'pairing' rule
pairing(PersonA, PersonB) :-
  likes(PersonA, PersonB),
  likes(PersonB, PersonA).

pairing(PersonA, PersonB) :-
  chatty(PersonA).

pairing(PersonA, PersonB) :-
  chatty(PersonB).

% Define the 'seating' rule
seating(Person1, Person2, Person3, Person4, Person5) :-
  pairing(Person1, Person2),
  pairing(Person2, Person3),
  pairing(Person3, Person4),
  pairing(Person4, Person5),
  pairing(Person5, Person1).
