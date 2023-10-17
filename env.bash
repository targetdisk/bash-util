add_path() { [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH" ; }
