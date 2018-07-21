:-style_check(-discontiguous).

position(contee, 1).
position(X, 2) :- colour(X, white).
position(X, 3) :- drink(X, rum).
position(_, 4).
position(_, 5).

colour(natsiou, blue). % natsiou blue hat
colour(X, purple) :- position(X, P1), position(Y, P2), colour(Y, green), P1 > P2.
colour(X, green) :- position(X, P1), position(Y, P2), colour(Y, purple), P1 < P2.
colour(X, green) :- drink(X, whiskey).
colour(X, red) :- origin(X, karnaca).
colour(X, white) :- position(X, 2).

origin(winslow, baleton).
origin(X, karnaca) :- colour(X, red), \+ heirloom(X, diamond).
origin(X, dunwall) :- drink(X, absinthe).
origin(X, dabovka) :- heirloom(X, medal).
origin(X, fraeport) :- \+ heirloom(X, ring), \+ drink(X, beer).

drink(marcolla, wine).
drink(X, rum) :- position(X, 3).
drink(X, absinthe) :- origin(X, dunwall).

heirloom(finch, pendant).
heirloom(X, medal) :- origin(X, dabovka).
heirloom(X, diamond) :- \+ origin(X, karnaca).
heirloom(X, ring) :- \+ origin(X, fraeport).
heirloom(_, snuff).