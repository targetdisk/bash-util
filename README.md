# Bash Helpers

Arcane incantations that we're tired of remembering how to do in Bash will end
up here.  Include me as a submodule in whenever you're writing shell scripts.

Patches welcome!

### Installing

Simply install with `make`!
```
# make install
```

If you'd like to install it to a different `PREFIX` simply specify one on the
`make` command-line (or in your environment):
```
$ PREFIX="$HOME/.local" make install
```

### Using in your scripts!

You can use the bash helpers in two ways:

    1. As a Git submodule
    2. From Bash's `$PATH` environment variable.

#### As a Git submodule

```
$ git submodule add https://github.com/targetdisk/bash-util.git
```

From your scripts you can now source the .bash files relative to the `bash-util`
directory in your tree.


#### From Bash's PATH

If you followed along with the **Installing** section you should have installed
the helpers somewhere in your environment's `$PATH`.  If so, you should now be
able to write scripts like:

```bash
#!/usr/bin/env bash

. logging.bash

die "I am dead now!"

echo "I never execute!"
```

Or even run this in your Bash shell:
```
$ . env.bash && add_path "$HOME/.local/bin"
```
