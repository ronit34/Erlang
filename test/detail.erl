-module(detail).
-export([test/1]).

test(A)->
	case is_integer(A) of
		true -> "I got an integer";
		_-> case is_atom(A) of
				true -> "I got an atom";
				_-> case is_number(A) of
						true -> "I got a number";
						_-> case is_list(A) of
								true -> "I got a list";
								_-> case is_tuple(A) of
										true -> "I got a tuple";
										_-> case is_boolean(A) of
												true -> "I got a boolean";
												_->"Not supported"
											end
									end
							end
					end
			end
	end.									

