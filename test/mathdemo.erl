-module(mathdemo).
-export([abs_value/1]).

abs_value(Number) when Number < 0 -> -Number;
abs_value(Number) when Number == 0 -> Number;
abs_value(Number) when Number > 0 -> Number.
