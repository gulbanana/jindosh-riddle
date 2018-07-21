name(X) :- member(X, [contee, natsiou, winslow, marcolla, finch]).

position(1). position(2). position(3). position(4). position(5). 
position(contee, 1).

colour(X) :- member(X, [blue, purple, green, red, white]).
colour(natsiou, blue).
colour(X, purple) :- name(X), position(X, P1), name(Y), position(Y, P2), colour(Y, green), P1 > P2.
colour(X, white) :- name(X), position(X, 2).

origin(baleton). origin(karnaca). origin(dunwall). origin(dabovka). origin(fraeport).
origin(winslow, baleton).
origin(X, karnaca) :- name(X), colour(X, red).

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

guest(Name, Position, Colour, Origin, Drink, Heirloom) :-
    name(Name),
    (position(Name, Position); position(Position)),
    (colour(Name, Colour); colour(Colour)),
    (origin(Name, Origin); origin(Origin)),
    (drink(Name, Drink); drink(Drink)),
    (heirloom(Name, Heirloom); heirloom(Heirloom)).