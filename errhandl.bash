# Don't want subsequent commands to run after nonzero exit?  Wrappy in happy!
happy() { $@ || exit $?; }
