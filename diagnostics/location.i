% Copyright

interface location

predicates
    get_part : () -> string Part.
    set_part : (string Part).
    get_specification : () -> string Specification.
    set_specification : (string Specification).
    include_symptom : (string A, string B, string C, string D) nondeterm.

end interface location
