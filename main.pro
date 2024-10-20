% Copyright

implement main
    open core, disease

domains
    symptom_t = (string Что, string Где, string Как, string Когда).

class facts - relatives
    symptom : (string Что, string Где, string Как, string Когда).

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
%            P = location::new("head", "left ear"),
%            Part = P:get_part(),
%            Specification = P:get_specification(),
%            stdio::write(Part, Specification),
            file::consult("dbfile.txt", relatives), % загрузка  базы фактов
            % Создание объекта disease
            Symptoms =
                [
                    ("боль" and "ухо" and "" and ""),
                    symptom_t("ухудшение слуха", "", "сильно", ""),
                    symptom_t("скованность", "челюсть", "сильно", "утром")
                ],
            Disease =
                disease::new("Артрит височно-нижнечелюстного сустава", Symptoms,
                    "Обратитесь к врачу для получения комплексного лечения, " ++ "включающего противовоспалительные препараты, физиотерапию и "
                        ++ "ограничение нагрузки на челюсть."),
            stdio::write(Disease:get_name()),
            stdio::write("Hello world!"),
            _ = stdio::readChar()
        end if.

end implement main

goal
    console::runUtf8(main::run).
