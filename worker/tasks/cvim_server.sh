#!/bin/sh

CMD=~/dotfiles/extapps/chromium-vim/cvim_server.py
case ${1} in
  start)
    nohup $CMD > /dev/null 2>&1 &
    exit 0
  ;;

  stop)
    ps aux | grep cvim_server.py
    pkill cvim_server.py
  ;;

  exec)
    eval $CMD
  ;;

  *)
    echo "Usage: ${0} {start|stop|exec}"
    exit 1
  ;;
esac
