#!/bin/sh

eval "$(anyenv init -)"

anyenv install -s rbenv
anyenv install -s ndenv

eval "$(anyenv init -)"

# TODO: Fetch latest ruby and node automatically
latest_ruby=2.2.2
latest_node=v0.12.7

rbenv install -s $latest_ruby
rbenv global $latest_ruby

echo 'n' | ndenv install $latest_node
ndenv global $latest_node


