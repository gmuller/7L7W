-module(translate).
-export([loop/0, translate/2]).
loop() ->
	receive
		{Pid, "casa"} ->
			Pid ! "house",
			loop();
		{Pid, "blanca"} ->
			Pid ! "white",
			loop();
		{Pid, _} -> 
			Pid ! "Huh?" ,
			loop()
end.

translate(To, Word) ->
	To ! {self(), Word},
	receive
		Translation -> Translation
	end.