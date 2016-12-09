split-exec() {
  tmux split-window "eval run-and-report $*"
}
