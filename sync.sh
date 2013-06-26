#!/bin/sh

if [ "$1" = "-n" ]; then
	dry_run="-n"
	shift
else
	dry_run=""
fi

exec rsync -rtmv $dry_run --exclude .ssh --exclude .local.sh rc/ $1
