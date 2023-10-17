# TODO: finish with all metacharacters needing escapes
sedify() { sed 's/\([$\/]\)/\\\1/g' <<<"$1" ; }
