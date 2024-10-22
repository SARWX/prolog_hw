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
            Artrit = disease::new("artrit", "be healthier"),
            %           Symptom_1 := s("боль", "голова", "сильно", "утром"),
            if Artrit:include_symptom(disease::s("боль", "голова", "сильно", "утром")) then
                stdio::write("\nУ вас Артрит")
            else
                stdio::write("\nМы не диагностировали у вас болезней")
            end if,
            if Artrit:include_symptom(disease::s("покраснение", "нога", "слабо", "вечером")) then
                stdio::write("\nУ вас Артрит")
            else
                stdio::write("\nМы не диагностировали у вас болезней")
            end if,
            _ = stdio::readChar()
        end if.

end implement main

goal
    console::runUtf8(main::run).
