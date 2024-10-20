% Copyright

interface disease

predicates
    get_name : () -> string Name.
    set_name : (string Name).
    get_symptoms : () -> symptom Symptoms.
    set_symptoms : (symptom Symptoms).
    get_general_state : () -> general_state GeneralState.
    set_general_state : (general_state GeneralState).

end interface disease
