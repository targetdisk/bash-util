#!/usr/bin/env bash

fns=( hello hi )

hello() {
	[ "$1" == help ] && echo -n "Say \"hello.\"" && return 0
	echo hello.
}

hi() {
	[ "$1" == help ] && echo -n "Say \"hi.\"" && return 0
	echo hi.
}

. "$(dirname "$0")/../dynamic_main.bash"
