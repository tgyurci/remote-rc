#!/bin/sh

if [ "$1" = "-n" ]; then
	dry_run="-n"
	shift
else
	dry_run=""
fi

for host in "$@"; do
	rsync -rtmv $dry_run --exclude '*.swp' --exclude .ssh --exclude .local.sh --exclude '.*.local' rc/ "$host"
done
