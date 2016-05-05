#!/bin/sh

set -eu

host="$1"

ssh "$host" sh -s << EOF
[ -f "\$HOME/.common.sh" ] && rm -v "\$HOME/.common.sh"
[ -f "\$HOME/.local.sh" ] && mv -v "\$HOME/.local.sh" "\$HOME/.shrc.local"
[ -f "\$HOME/.local.bash" ] && mv -v "\$HOME/.local.bash" "\$HOME/.bashrc.local"
[ -f "\$HOME/.local.zsh" ] && mv -v "\$HOME/.local.zsh" "\$HOME/.zshrc.local"
EOF
