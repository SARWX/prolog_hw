﻿% Copyright

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
            P = location::new("John"),
            Name = P:getName(),
            stdio::write(Name),
            stdio::write("Hello world!"),
            _ = stdio::readChar()
        end if.

end implement main

goal
    console::runUtf8(main::run).
