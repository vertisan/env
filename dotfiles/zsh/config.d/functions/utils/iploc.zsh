iploc() {
  IP=$1

  if [ -x "$(command -v http)" ]; then
    http -p b GET "https://geo.ipify.org/api/v1?apiKey=at_wwTbqYjp1e9hWg8FEz37HZRUKR6Mu&ipAddress=${IP}"
  else
    curl "https://geo.ipify.org/api/v1?apiKey=at_wwTbqYjp1e9hWg8FEz37HZRUKR6Mu&ipAddress=${IP}" | json_pp
  fi

}
