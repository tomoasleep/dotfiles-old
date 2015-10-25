#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set private.vim_keybind_apps_esc_with_eisuu 1
/bin/echo -n .
$cli set option.emacsmode_controlM 1
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
/bin/echo
