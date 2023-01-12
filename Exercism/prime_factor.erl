-module(prime_factor).
-export([factors/1]).

factors(1) -> [];
factors(Value) -> 
    factors(Value, 2).
factors(Value, Value) -> 
    [Value];

factors(Value, Divisor) when Value rem Divisor =:= 0 -> 
    [Divisor | factors(Value div Divisor)];

factors(Value, Divisor) -> 
    factors(Value, Divisor+1).
