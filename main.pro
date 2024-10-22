% Copyright

implement main
    open core

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
            P = location::new("head", "left ear"),
            Part = P:get_part(),
            if P:include_symptom("боль", "голова", "сильно", "утром") then
                stdio::write("\nИван является отцом Петра")
            else
                stdio::write("\nИван не является отцом Петра")
            end if,
            if P:include_symptom("покраснение", "нога", "слабо", "вечером") then
                stdio::write("\nИван является отцом Петра")
            else
                stdio::write("\nИван не является отцом Петра")
            end if,
            Specification = P:get_specification(),
            stdio::write(Part, Specification),
            stdio::write("Hello world!"),
            _ = stdio::readChar()
        end if.

end implement main

goal
    console::runUtf8(main::run).
