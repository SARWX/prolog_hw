% Copyright

implement symptom

facts
    location : location.
    issue : issue.
    time_observed : string.
    severity : integer.

clauses
    new(Location, Issue, TimeObserved, Severity) :-
        location := Location,
        issue := Issue,
        time_observed := TimeObserved,
        severity := Severity.

clauses
    get_location() = location.

clauses
    set_location(Location) :-
        location := Location.

clauses
    get_issue() = issue.

clauses
    set_issue(Issue) :-
        issue := Issue.

clauses
    get_time_observed() = time_observed.

clauses
    set_time_observed(TimeObserved) :-
        time_observed := TimeObserved.

clauses
    get_severity() = severity.

clauses
    set_severity(Severity) :-
        severity := Severity.

end implement symptom
