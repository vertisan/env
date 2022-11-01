function xray-id() {
  START_TIME=$(date +%s)
  HEX_TIME=$(printf '%x\n' $START_TIME)
  GUID=$(dd if=/dev/random bs=12 count=1 2>/dev/null | od -An -tx1 | tr -d ' \t\n')
  TRACE_ID="1-$HEX_TIME-$GUID"
  echo $TRACE_ID
}
