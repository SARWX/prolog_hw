% Copyright

implement disease

facts
    name : string.
    advice : string.
    total_symptom_n : integer.
%    general_state : general_state.

facts - diseae_db
%    symptom : (string What, string Where, string How, string Condition).
    symptom : (symptom_t).

predicates
    count_symptoms_in_db : () failure.
clauses
    new(Name, SymptomFile, AdviceFile) :-
        name := Name,
        advice := file::readString(AdviceFile), % Чтение строки из файла в advice
        total_symptom_n := 0,
%        general_state := GeneralState,
        file::consult(SymptomFile, diseae_db),
        if count_symptoms_in_db() then
            stdio::write("not possible")
        else
%            stdio::write(total_symptom_n)
        end if.

    get_name() = name.

    set_name(Name) :-
        name := Name.

    get_advice() = advice.

    set_advice(Advice) :-
        advice := Advice.

clauses
    % Реализация функции для подсчета симптомов в базе данных
    count_symptoms_in_db() :-
        % Считаем количество фактов symptom в базе
%        Count = 0, % Здесь должна быть логика подсчета
        symptom(_), % Здесь должно быть условие для подсчета
        total_symptom_n := total_symptom_n + 1,
        fail. % для завершения перебора всех фактов

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

clauses
% Возвращает процент вероятности наличия болезни
% в виде целого числа (например 50 = 50%)
    count_symptoms([], Count) = Count * 100 div total_symptom_n.

    count_symptoms([Symptom | RestSymptoms], Count) = MatchedCount :-
        if include_symptom(Symptom) then
            NewCount = Count + 1
        else
            NewCount = Count
        end if,
        MatchedCount = count_symptoms(RestSymptoms, NewCount).

end implement disease
%    get_general_state() = general_state.
%    set_general_state(GeneralState) :-
%       general_state := GeneralState.
