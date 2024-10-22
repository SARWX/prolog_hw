% Copyright

implement disease

facts
    name : string.
    advice : string.
%    general_state : general_state.

class facts - diseae_db
%    symptom : (string What, string Where, string How, string Condition).
    symptom : (symptom_t).

clauses
    new(Name, Advice) :-
        name := Name,
        advice := Advice,
%        general_state := GeneralState,
        file::consult("artrit.txt", diseae_db).

    get_name() = name.

    set_name(Name) :-
        name := Name.

    get_advice() = advice.

    set_advice(Advice) :-
        advice := Advice.

clauses
%    include_symptom(What, Where, How, Condition) :-
    include_symptom(Symptom) :-
%    symptom(What, Where, How, Condition).
        symptom(Symptom).

end implement disease
%    get_general_state() = general_state.
%    set_general_state(GeneralState) :-
%       general_state := GeneralState.
