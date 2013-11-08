-module(pacman).
-export([start/0]).
-export([pacman1/1]).
-export([misspacman/0]).

% to run:
% erl
% c(pacman).
% pacman:start().

pacman1(A) ->
	receive
		{From, fish} ->
			io:format("I like fish very much~n"),
			io:format("Pacman sends a kiss to Miss~n"),
			From ! {self(), kiss};
		{From, bread} ->
			io:format("Je n'aime pas le pain.~n");
		{From, thanks} ->
			io:format("No problem, miss~n");
		_ ->
			io:format("NOTHING TO SEE HERE~n")
	end,
	pacman1(A+1).

misspacman() ->
	receive
		{boot, Pacman} ->
			io:format("Miss received boot~n"),
			io:format("Sending fish to Pacman~n"),
			Pacman ! {self(), fish};
		{From, kiss} ->
			io:format("Miss receives a kiss !~n"),
			From ! {self(), thanks};
		_ ->
			io:format("MISS does not know what to do.~n")
	end,
	misspacman().

start() ->
	Pacman = spawn(pacman, pacman1, [0]),
	Miss = spawn(pacman, misspacman, []),
%	Joe ! {Miss, fish}.
	Miss ! {boot, Pacman}.
