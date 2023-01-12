-module(moving_pattern_matching).
-export([fall_velocity/2]).

% fall_velocity(Planemo, {Num1,Num2}) when {Num1,Num2} >= 0 ->
% 	case Planemo of
% 		add -> Num1 + Num2;
% 		sub -> Num1 - Num2;
% 		mul -> Num1 * Num2;
% 		devi -> Num1 / Num2;
% 		remi -> Num1 rem Num2
% 	end.
% fall_velocity(Planemo, {Num1,Num2}) when {Num1,Num2} =< 0 ->
% 	case Planemo of
% 		add -> Num1 + Num2;
% 		sub -> Num1 - Num2;
% 		mul -> Num1 * Num2;
% 		devi -> Num1 / Num2;
% 		remi -> Num1 rem Num2
% 	end;
% fall_velocity(Planemo, {Num1,Num2}) when {Num1,Num2} == 0 ->
% 	case Planemo of
% 		add -> Num1 + Num2;
% 		sub -> Num1 - Num2;
% 		mul -> Num1 * Num2;
% 		devi -> Num1 / Num2;
% 		remi -> Num1 rem Num2
% 	end.

% ===========================================================================

% fall_velocity(Planemo, Distance) when Distance >= 0 ->
% 	Gravity = case Planemo of
% 		erath -> 9.8;
% 		moon -> 1.6;
% 		mars -> 3.71
% 	end,
% 	math:sqrt(5 * Gravity * Distance).

% ============================================================================

% fall_velocity(Planemo, Distance) ->
% 	Gravity = case Planemo of
% 		earth when Distance >= 0 -> 9.8;
% 		moon when Distance >= 0 -> 1.6;
% 		mars when Distance >= 0 -> 3.71
% 	end,
% math:sqrt(2 * Gravity * Distance).

% =======================================================================

