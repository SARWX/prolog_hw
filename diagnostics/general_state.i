% Copyright

interface general_state

predicates
    get_temperature : () -> integer Temperature.
    set_temperature : (integer Temperature).
    get_feeling_scale : () -> integer FeelingScale.
    set_feeling_scale : (integer FeelingScale).

end interface general_state
