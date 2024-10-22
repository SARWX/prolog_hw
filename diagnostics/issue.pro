% Copyright

implement issue

facts
    general_issue : string.
    specific_issue : string.
    symptom : (string A, string B, string C, string D).

clauses
    new(GeneralIssue, SpecificIssue) :-
        general_issue := GeneralIssue,
        specific_issue := SpecificIssue.

clauses
    get_general_issue() = general_issue.

clauses
    set_general_issue(GeneralIssue) :-
        general_issue := GeneralIssue.

clauses
    get_specific_issue() = specific_issue.

clauses
    set_specific_issue(SpecificIssue) :-
        specific_issue := SpecificIssue.

end implement issue
