% Copyright

implement main
    open core

domains
    symptom_t = s(string What, string Where, string How, string Condition).

constants
%   symptom_1 : symptom_t = s("боль", "голова", "сильно", "утром").

clauses
    run() :-
        CP = commandLineParser::new(),
        CP:acceptEmpty := true,
        CP:addOption_help("-help"),
        % define command line options here
        if ErrorMessage = CP:parse():isSome() then
            stdio::errorStream:write(ErrorMessage),
            programControl::setApplicationExitCode(2)
        else
            % Зададим симптомы пациента
            Patient_test =
                [
                    % Симптомы для Артрита височно-нижнечелюстного сустава
                    disease::s("боль", "ухо", "пульсирующая", "в покое"),
                    disease::s("ухудшение слуха", "ухо", "сильно", "постоянно"),
                    disease::s("скованность", "челюсть", "сильно", "утром"),
                    disease::s("шум", "ухо", "слабый", "в тишине"),
                    disease::s("боль", "челюсть", "усиливается", "при движении челюстью"),
                    % Симптомы для Гнойного артрита височно-нижнечелюстного сустава
                    disease::s("боль", "ухо", "сильно", "ночью"),
                    disease::s("заложенность", "ухо", "постоянная", "в любое время"),
                    disease::s("покраснение", "височно-нижнечелюстной сустав", "ярко выраженное", "в покое"),
                    disease::s("припухлость", "височно-нижнечелюстной сустав", "слабо выраженная", "при надавливании"),
                    disease::s("повышенная температура тела", "всё тело", "значительное", "вечером"),
                    % Дополнительные симптомы, не относящиеся к делу
                    disease::s("боль", "спина", "лёгкая", "после долгого сидения"),
                    disease::s("усталость", "всё тело", "умеренная", "вечером"),
                    disease::s("зуд", "рука", "небольшой", "после контакта с холодом"),
                    disease::s("напряжение", "шея", "лёгкое", "в конце дня")
                ],
            % Теперь подвергнем их диагностике
            Artrit = disease::new("artrit", "be healthier"),
            %           Symptom_1 := s("боль", "голова", "сильно", "утром"),
            % Запуск проверки и вывод результата
            stdio::write(Artrit:count_symptoms(Patient_test, 0)),
%            stdio::writef("Совпадений с симптомами артрита: %d\n", Count),
            _ = stdio::readChar()
        end if.

end implement main

goal
    console::runUtf8(main::run).
