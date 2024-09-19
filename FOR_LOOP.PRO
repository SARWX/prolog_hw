DOMAINS
    i = integer
    stop = integer
    
DATABASE
    iterator(i, stop)   % Declaring the dynamic predicate

PREDICATES
    repeat
    cycle_for
    start
    init(i, stop)

CLAUSES
    % Initialize the loop with start and stop values
    init(I, Stop) :-
        asserta(iterator(I, Stop)).

    % Start the loop
    start :-
        write("Enter the stop value: "), readint(Stop), nl,
        init(0, Stop),           % Start the loop from I = 0
        cycle_for.               % Call the FOR cycle logic

    % Repeat clause simulating an infinite loop
    repeat.
    repeat :-
        repeat.

    % The FOR cycle implementation
    cycle_for :-
        repeat,                     % Start an infinite loop
        iterator(I, Stop),          % Get current I and Stop values
        I <= Stop,                  % Continue while I <= Stop
        % Loop body here
        write("I = "), write(I), nl, % Print the current I
        retract(iterator(I, Stop)),  % Remove the current iterator value
        NewI = I + 1,               % Increment I
        asserta(iterator(NewI, Stop)), % Store the new I value
        fail.                       % Force backtracking to repeat
    cycle_for :-                     % End condition when I > Stop
        iterator(I, Stop),
        I > Stop, !,
        write("Loop completed."), nl.

GOAL
    start.
