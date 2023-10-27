gpg-sendkey() {
  servers=("pgp.mit.edu" "keys.gnupg.net" "hkps://keyserver.ubuntu.com" "hkps://keys.openpgp.org")

  for server in "${servers[@]}"; do
    gpg --keyserver "$server" --send-key "$1"
  done
}

