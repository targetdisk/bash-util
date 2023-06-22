errcho() { (>&2 echo $@); }
errcat() { (>&2 cat <<<"$@"); }
dedcat() { (>&2 cat <<<"$@"); exit 1; }
excat() { (>&2 cat <<<"$@"); exit 0; }
die() { errcho $@; exit 1; }
