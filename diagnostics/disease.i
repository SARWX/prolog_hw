% Copyright

interface disease

domains
    symptom_t = (string Что, string Где, string Как, string Когда).

predicates
    get_name : () -> string Name.
    set_name : (string Name).
    get_symptoms : () -> symptom_t* Symptoms.
    set_symptoms : (symptom_t* Symptoms).
    get_recommendations : () -> string Recommendations.
    set_recommendations : (string Recommendations).
    %   is_symptom : (symptom_t Symptom) -> boolean Result determ.
    is_symptom : (symptom_t Symptom) determ.

end interface disease
