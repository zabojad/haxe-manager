#!/bin/sh

ROOT=$(dirname $(readlink -f $0))

sh "$ROOT/++haxe/install.sh"
sh "$ROOT/current/install.sh"
sh "$ROOT/fzf/install.sh"
sh "$ROOT/list/install.sh"
sh "$ROOT/rofi/install.sh"
sh "$ROOT/watcher/install.sh"
