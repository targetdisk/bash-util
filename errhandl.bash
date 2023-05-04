# Don't want subsequent commands to run after nonzero exit?  Wrappy in happy!
unhappy_ending() {
  stat=$1; shift
  (echo "Error while running: \"$@\"" >&2)
  exit $stat
}
happy() { $@ || unhappy_ending $? $@; }
