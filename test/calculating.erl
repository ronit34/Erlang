-module(calculating).
-export([fall_velocity/1, mps_to_mph/1,mps_to_kph/1,add/2,sub/2,mul/2,divi/2,remi/2,divide/2]).
% -compile(export_all).


fall_velocity(Distance) -> math:sqrt(2 * 9.8 * Distance).
mps_to_mph(Mps) -> 2.23693629 * Mps.
mps_to_kph(Mps) -> 3.6 * Mps.
add(A,B) -> A + B.
sub(A,B) -> A - B.
mul(A,B) -> A * B.
divi(A,B) -> A div B.
remi(A,B) -> A rem B.

divide(A,B) -> add(A,B)/mul(A,B).

