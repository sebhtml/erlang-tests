#!/bin/bash

erlc latency_probe.erl

erl -noshell -s latency_probe start

#erl -sname erlang-0 -detached  &
#erl -sname erlang-1 &
#erl -sname erlang-2 &
#erl -sname erlang-3 &

wait
