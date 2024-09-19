PREDICATES
    cycle_for(integer, integer)
    

GOAL
    start,
    cycle_for(0, 10).

CLAUSES
    start :-
        % readint(I), nl,
        readint(Stop), nl,
        cycle_for(0, Stop)
    cycle_for(I, Stop) :-
        % Тело цикла
        NewI = I + 1,  % инкремент
        NewI < Stop ; cycle_for(I, Stop).