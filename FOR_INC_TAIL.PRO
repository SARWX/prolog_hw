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
        % ���� 横��
        NewI = I + 1,  % ���६���
        NewI < Stop ; cycle_for(I, Stop).