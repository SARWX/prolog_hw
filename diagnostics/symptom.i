% Copyright

interface symptom

predicates
    get_location : () -> location Location.
    set_location : (location Location).
    get_issue : () -> issue Issue.
    set_issue : (issue Issue).
    get_time_observed : () -> string TimeObserved.
    set_time_observed : (string TimeObserved).
    get_severity : () -> integer Severity.
    set_severity : (integer Severity).

end interface symptom
