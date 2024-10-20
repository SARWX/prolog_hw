% Copyright

implement location

facts
    part : string.
    specification : string.

clauses
    new(Part, Specification) :-
        part := Part,
        specification := Specification.

clauses
    get_part() = part.

clauses
    set_part(Part) :-
        part := Part.

clauses
    get_specification() = specification.

clauses
    set_specification(Specification) :-
        specification := Specification.

end implement location
