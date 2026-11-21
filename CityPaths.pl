% City Paths

% Connections between cities (directed edges)

edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').

edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').

edge('Makkah', 'Riyadh').

edge('Taif', 'Dammam').

edge('Dammam', 'Qatif').
edge('Qatif', 'Dammam').

edge('Qatif', 'Madinah').

edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').

% Find a path between two cities

travel(Start, End, Path) :-
    travel_path(Start, End, [Start], ReversePath),
    reverse(ReversePath, Path).

travel_path(End, End, Visited, Visited).

travel_path(Current, End, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    travel_path(Next, End, [Next|Visited], Path).
