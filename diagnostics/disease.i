% Copyright

interface disease

domains
    symptom_t = s(string What, string Where, string How, string Condition).

predicates
    get_name : () -> string Name.
    set_name : (string Name).
    get_advice : () -> string Advice.
    set_advice : (string Advice).
    %   include_symptom : (string A, string B, string C, string D) nondeterm.
    include_symptom : (symptom_t) nondeterm.
    count_symptoms : (symptom_t*, integer) -> integer MatchedCount.
    %   count_symptomss : (symptom_t*).

%    get_general_state : () -> general_state GeneralState.
%   set_general_state : (general_state GeneralState).
end interface disease
%(s(i,i,i,i)) (s(i,i,i,o)) (s(i,i,o,i)) (s(i,i,o,o)) (s(i,o,i,i)) (s(i,o,i,o)) (s(i,o,o,i)) (s(i,o,o,o))
