-module(factorial).
-export([main/0]).

factorial(N) -> factorial_tail(N, 1).

factorial_tail(0, Value) -> Value;
factorial_tail(N, Value) -> io:format("LOL~n"),
				factorial_tail(N - 1, N * Value).

main() ->
	factorial(39).
