errcho() { (>&2 echo $@); }
errcat() { (>&2 cat <<<"$@"); }
die() { errcho $@; exit 1; }
