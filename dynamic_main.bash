command -v dedcat || \
	source "$(dirname ${BASH_SOURCE[0]})/logging.bash"

[ "${#fns[@]}" -gt 0 ] || dedcat 'ERROR: Empty or undefined ${fns[@]} array!'

read -d '' HELPSTR <<EOH
Usage:  $0 OPERATION
$EXTRA_NOTE
Operations:
$(for fn in ${fns[@]}; do echo "  $fn:  $($fn help)"; done)
EOH

[[ " ${fns[*]} " =~ [[:space:]]${1}[[:space:]] ]] \
	|| dedcat "$HELPSTR"

op="$1"
shift
$op $@
