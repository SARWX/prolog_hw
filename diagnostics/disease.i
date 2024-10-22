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

%    get_general_state : () -> general_state GeneralState.
%   set_general_state : (general_state GeneralState).
end interface disease
