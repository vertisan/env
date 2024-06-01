ds() {
  docker ps --format "table {{.ID}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"
}

