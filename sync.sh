#!/bin/sh

set -eu

fail() {
	echo "$@" >&2
	exit 1
}

n_opt=""

while getopts ":n-" opt; do
	case "$opt" in
		n) n_opt="1" ;;
		-) break ;;
		\?) fail "Invalid flag: $OPTARG" ;;
	esac
done
shift $(($OPTIND - 1))

[ $# -gt 0 ] || fail "Usage: $0 [-n] [--] target ..."

for target; do
	rsync -crpmv ${n_opt:+"-n"} \
		--exclude="*.swp" \
		--exclude=".ssh" \
		--exclude=".local.sh" \
		--exclude=".*.local" \
		rc/ "$target"
done
