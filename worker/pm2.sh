#!/bin/sh

DIR=`dirname $0`
for file in `\find $DIR/tasks -maxdepth 1 -type f`; do
  pm2 start $file -- exec
done
