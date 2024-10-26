% Copyright

implement main
    open core

class predicates
    diagnose_disease : (disease, disease::symptom_t*) determ.

constants
    threshold = 50.

clauses
    % Предикат для диагностики заболевания
    diagnose_disease(DiseaseObject, PatientSymptoms) :-
        Diagnosis = DiseaseObject:count_symptoms(PatientSymptoms, 0),
        if Diagnosis > threshold then
            stdio::write("\nС вероятностью ", Diagnosis, "% у вас ", DiseaseObject:get_name(), "\n"),
            stdio::write("\nРекомендации:\n", DiseaseObject:get_advice(), "\n"),
            succeed
        else
            stdio::write("\nМы не диагностировали у вас ", DiseaseObject:get_name(), "\n"),
            fail
        end if.

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
            Artrit = disease::new("Артрит", "artrit_symptoms.txt", "artrit_advice.txt"),
            if diagnose_disease(Artrit, Patient_test) then
                % Теперь проверим является ли артрит гнойным
                Gnoy_Artrit = disease::new("Гнойный Артрит", "gnoy-artrit_symptoms.txt", "gnoy-artrit_advice.txt"),
                if diagnose_disease(Gnoy_Artrit, Patient_test) then
                end if
            else
            end if,
            % Не по заданию
            Osteoartrit = disease::new("Остеоартрит", "osteoartrit_symptoms.txt", "osteoartrit_advice.txt"),
            if diagnose_disease(Osteoartrit, Patient_test) then
            end if,
            Podagra = disease::new("Подагра", "podagra_symptoms.txt", "podagra_advice.txt"),
            if diagnose_disease(Podagra, Patient_test) then
            end if,
            _ = stdio::readChar()
        end if.

end implement main

goal
    console::runUtf8(main::run).
