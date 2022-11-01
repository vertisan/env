dcp() {
  h2 "Downloading file from container '$1' at path '$2' into '$3'"
  docker cp $1:$2 $3
  h2 "Download completed."
}
