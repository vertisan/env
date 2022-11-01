weather() {
  curl "wttr.in/${1:-Gliwice}?2&F"
}
