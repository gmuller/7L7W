-module(day_one).
-export([count_words/1]).
-export([upto/1]).
-export([printMessage/1]).

list_length([]) -> 0;
list_length([Head|Tail]) -> 1 + list_length(Tail).
count_words(String) -> 
	Words = string:tokens(String, " "),
	list_length(Words).
	
upto(Value, Target) when Value < Target ->
	io:fwrite("~w~n", [Value]),
	upto(Value + 1, Target);
upto(Target, Target) -> io:fwrite("~w~n", [Target]).
upto(Target) -> upto(0, Target).

printMessage({error, Msg}) -> io:fwrite("Error: ~s~n", [Msg]);
printMessage(success) -> io:fwrite("Success!~n").