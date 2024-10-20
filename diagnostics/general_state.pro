% Copyright

implement general_state

facts
    temperature : integer.
    feeling_scale : integer.

clauses
    new(Temperature, FeelingScale) :-
        temperature := Temperature,
        feeling_scale := FeelingScale.

    get_temperature() = temperature.

    set_temperature(Temperature) :-
        temperature := Temperature.

    get_feeling_scale() = feeling_scale.

    set_feeling_scale(FeelingScale) :-
        feeling_scale := FeelingScale.

end implement general_state
