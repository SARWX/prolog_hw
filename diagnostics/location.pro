% Copyright

implement location

facts
    name : string.

clauses
    new(Name) :-
        name := Name.

clauses
    getName() = name.

clauses
    setName(Name) :-
        name := Name.

end implement location
