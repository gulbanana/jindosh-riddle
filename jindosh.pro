name(X) :- member(X, [contee, natsiou, winslow, marcolla, finch]).

position(1). position(2). position(3). position(4). position(5). 
position(contee, 1).
position(X, 2) :- name(X).
position(X, 3) :- name(X).
position(X, 4) :- name(X).
position(X, 5) :- name(X).

colour(X) :- member(X, [blue, purple, green, red, white]).
colour(natsiou, blue).
colour(X, purple) :- name(X), position(X, P1), name(Y), position(Y, P2), colour(Y, green), P1 > P2.
colour(X, white) :- name(X), position(X, 2).
colour(X, red) :- name(X).
colour(X, green) :- name(X).

origin(baleton). origin(karnaca). origin(dunwall). origin(dabovka). origin(fraeport).
origin(winslow, baleton).
origin(X, karnaca) :- name(X), colour(X, red).
origin(X, dabovka) :- name(X).
origin(X, fraeport) :- name(X).
origin(X, dunwall) :- name(X).

drink(wine). drink(rum). drink(absinthe). drink(whiskey). drink(beer).
drink(marcolla, wine).
drink(X, rum) :- name(X), position(X, 3).
drink(X, absinthe) :- name(X), origin(X, dunwall).
drink(X, whiskey) :- name(X), colour(X, green).
drink(X, beer) :- name(X), \+ origin(X, fraeport).

heirloom(pendant). heirloom(medal). heirloom(diamond). heirloom(ring). heirloom(snuff).
heirloom(finch, pendant).
heirloom(X, medal) :- name(X), origin(X, dabovka).
heirloom(X, diamond) :- name(X), \+ origin(X, karnaca).
heirloom(X, ring) :- name(X), \+ origin(X, fraeport).
heirloom(X, snuff) :- name(X).

guest(Name, Position, Colour, Origin, Drink, Heirloom) :-
    name(Name),
    position(Position), position(Name, Position),
    colour(Colour), colour(Name, Colour),
    origin(Origin), origin(Name, Origin),
    drink(Drink), drink(Name, Drink),
    heirloom(Heirloom), heirloom(Name, Heirloom).