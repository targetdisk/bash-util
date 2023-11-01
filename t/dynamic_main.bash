#!/usr/bin/env bash

fns=( hello )

hello() {
	[ "$1" == help ] && echo -n "Say \"hello.\"" && return 0
	echo hello.
}

. "$(dirname "$0")/../dynamic_main.bash"
