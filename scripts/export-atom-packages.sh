#!/bin/sh
apm list -i --bare | grep @ | grep -v '@0.0.0' > $HOME/.atom/atom-packages.new
diff -u $HOME/.atom/atom-packages $HOME/.atom/atom-packages.new
mv -f $HOME/.atom/atom-packages.new $HOME/.atom/atom-packages
