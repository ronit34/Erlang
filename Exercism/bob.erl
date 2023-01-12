-module(bob).
-export([test/1]).


test(String)->
    case String of
        "How are you?" -> "Sure";
        []-> "Fine. Be that way!.";
         _-> "Whatever."
    end.


% [
    %     {name, "anil"},
    %     {marks, 40},
    %     {subject, maths}
    % ],
    
% He answers 'Whoa, chill out!' if you YELL AT HIM (in all capitals).

% He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
