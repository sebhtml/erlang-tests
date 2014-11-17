-module(latency_probe).
-export([start/0]).
-export([process/0]).

process() ->
    receive
        action_start ->
            io:format("Hello~n")
    end,
    io:format("the end~n").

start() ->
    InitialActor0 = spawn(latency_probe, process, []),
    InitialActor0 ! action_start,
    init:stop().



