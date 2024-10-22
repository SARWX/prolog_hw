% Copyright

implement location

facts
    part : string.
    specification : string.

class facts - test_bd
    symptom : (string A, string B, string C, string D).

clauses
    new(Part, Specification) :-
        part := Part,
        specification := Specification,
        file::consult("test.txt", test_bd).

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

clauses
    include_symptom(A, B, C, D) :-
        symptom(A, B, C, D).

end implement location
