-module(space_age).
-export([age/2]).
age(Planet, Sec) ->
	Sec / (365.25 * orbital_period(Planet)) / 24 / 60 / 60.
orbital_period(earth) ->
	1;
orbital_period(mercury) ->
	0.2408467;
orbital_period(venus) ->
	0.61519726;
orbital_period(mars) ->
	1.8808158;
orbital_period(jupiter) ->
	11.862615;
orbital_period(saturn) ->
	29.447498;
orbital_period(uranus) ->
	84.016846;
orbital_period(neptune) ->
	164.79132.