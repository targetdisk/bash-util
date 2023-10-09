define_usage() { read -d '' usage; }
errcho() { (>&2 echo $@); }
ercat() { (>&2 cat "$@"); }
errcat() { (>&2 cat <<<"$@"); }
dedcat() { (>&2 cat <<<"$@"); exit 1; }
xcat() { (>&2 cat "$@"); exit 0; }
excat() { (>&2 cat <<<"$@"); exit 0; }
die() { errcho $@; exit 1; }
