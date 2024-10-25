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

clauses
    include_symptom(s(What, Where, How, When)) :-
        symptom(s(FactWhat, FactWhere, FactHow, FactWhen)),
        % Проверяем, что первая позиция совпадает
        What = FactWhat,
        % Остальные позиции могут совпадать или быть "_"
        (Where = FactWhere or FactWhere = "_" or Where = "_" and FactWhere = _),
        (How = FactHow or FactHow = "_" or How = "_" and FactHow = _),
        (When = FactWhen or FactWhen = "_" or When = "_" and FactWhen = _).

%    symptom(What, Where, How, Condition).
end implement disease
%    get_general_state() = general_state.
%    set_general_state(GeneralState) :-
%       general_state := GeneralState.
