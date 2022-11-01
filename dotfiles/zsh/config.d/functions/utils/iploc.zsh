iploc() {
  IP=$1

  if [ -x "$(command -v http)" ]; then
    http -p b GET "https://geo.ipify.org/api/v1?apiKey=${IPIFY_API_KEY}&ipAddress=${IP}"
  else
    curl "https://geo.ipify.org/api/v1?apiKey=${IPIFY_API_KEY}&ipAddress=${IP}" | json_pp
  fi
}
