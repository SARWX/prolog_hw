% Copyright

implement disease

facts
    name : string.
    symptoms : symptom_t*.
    recommendations : string.

clauses
    new(Name, Symptoms, Recommendations) :-
        name := Name,
        symptoms := Symptoms,
        recommendations := Recommendations.

    get_name() = name.

    set_name(Name) :-
        name := Name.

    get_symptoms() = symptoms.

    set_symptoms(Symptoms) :-
        symptoms := Symptoms.

    get_recommendations() = recommendations.

    set_recommendations(Recommendations) :-
        recommendations := Recommendations.

    is_symptom(Symptom) :-
        % Проверка наличия симптома в списке symptoms
        Symptom in symptoms.

end implement disease
