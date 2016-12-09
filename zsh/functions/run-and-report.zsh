run-and-report() {
  eval $@
  echo "Finished $@ with status $?."
  read
}
