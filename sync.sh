#!/bin/sh

exec rsync -amv --exclude .ssh --exclude .local.sh rc/ $1
