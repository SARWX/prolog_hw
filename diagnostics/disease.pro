% Copyright

implement disease

facts
    name : string.
    symptoms : symptom.
    general_state : general_state.

clauses
    new(Name, Symptoms, GeneralState) :-
        name := Name,
        symptoms := Symptoms,
        general_state := GeneralState.

    get_name() = name.

    set_name(Name) :-
        name := Name.

    get_symptoms() = symptoms.

    set_symptoms(Symptoms) :-
        symptoms := Symptoms.

    get_general_state() = general_state.

    set_general_state(GeneralState) :-
        general_state := GeneralState.

end implement disease
