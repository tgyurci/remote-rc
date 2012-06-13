#!/bin/sh

exec rsync -rmv --exclude .ssh --exclude .local.sh rc/ $1
