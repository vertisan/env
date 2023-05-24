#!/bin/zsh

dns() {
  DOMAIN=$1
  SERVER=$2

  host -a "$DOMAIN" "${SERVER:-8.8.8.8}"
}
