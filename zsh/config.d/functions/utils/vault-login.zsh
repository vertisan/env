#!/usr/bin/env bash

VAULT_TOKEN_FILE="/tmp/vault_token_data.json"
VAULT_OIDC_ROLE=vault_admin
TOKEN_ONLY=false

check_token_validity() {
  if [[ ! -f "$VAULT_TOKEN_FILE" ]]; then
    return 1
  fi

  # Extract token from file
  TOKEN=$(jq -r '.auth.client_token' "$VAULT_TOKEN_FILE" 2>/dev/null)
  if [[ -z "$TOKEN" || "$TOKEN" == "null" ]]; then
    return 1
  fi

  # Check token expiration
  EXPIRE_TIME=$(jq -r '.auth.lease_duration' "$VAULT_TOKEN_FILE" 2>/dev/null)
  CREATION_TIME=$(jq -r '.auth.creation_time' "$VAULT_TOKEN_FILE" 2>/dev/null || stat -f %m "$VAULT_TOKEN_FILE")

  if [[ -z "$EXPIRE_TIME" || "$EXPIRE_TIME" == "null" ]]; then
    return 1
  fi

  # Calculate expiration time
  CURRENT_TIME=$(date +%s)
  # If creation_time is not in the JSON, use file modification time
  if [[ -z "$CREATION_TIME" || "$CREATION_TIME" == "null" ]]; then
    CREATION_TIME=$(stat -f %m "$VAULT_TOKEN_FILE")
  else
    # Convert RFC3339 format to Unix timestamp if needed
    if [[ "$CREATION_TIME" == *"T"* ]]; then
      CREATION_TIME=$(date -j -f "%Y-%m-%dT%H:%M:%S" "${CREATION_TIME%%.*}" "+%s" 2>/dev/null || echo "$CREATION_TIME")
    fi
  fi

  EXPIRATION_TIME=$((CREATION_TIME + EXPIRE_TIME))

  # Return 1 if token has expired (or will expire in the next 60 seconds)
  if (( CURRENT_TIME + 60 >= EXPIRATION_TIME )); then
    return 1
  fi

  return 0
}

login_to_vault() {
  [[ "$TOKEN_ONLY" == "false" ]] && h2 "Token is expired, re-authenticating..."

  # Perform login and save output to token file
  vault login -method oidc role=${VAULT_OIDC_ROLE} -format=json > "$VAULT_TOKEN_FILE"

  if [[ $? -ne 0 ]]; then
    [[ "$TOKEN_ONLY" == "false" ]] && h2 "Failed to login to Vault"
    exit 1
  fi

  # Add creation time to the JSON if it's not already there
  if ! jq -e '.auth.creation_time' "$VAULT_TOKEN_FILE" > /dev/null 2>&1; then
    CURRENT_TIME=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    jq --arg time "$CURRENT_TIME" '.auth.creation_time = $time' "$VAULT_TOKEN_FILE" > "${VAULT_TOKEN_FILE}.tmp" &&
    mv "${VAULT_TOKEN_FILE}.tmp" "$VAULT_TOKEN_FILE"
  fi

  [[ "$TOKEN_ONLY" == "false" ]] && h2 "Successfully logged in to Vault"
}

vault-login() {
  [[ "$TOKEN_ONLY" == "false" ]] && h1 "Logging in to Vault..."

  while [[ $# -gt 0 ]]; do
    case $1 in
      --token-only)
        TOKEN_ONLY=true
        shift
        ;;
      *)
        [[ "$TOKEN_ONLY" == "false" ]] && h2 "Unknown option: $1"
        exit 1
        ;;
    esac
  done

  if ! check_token_validity; then
    login_to_vault
  else
    [[ "$TOKEN_ONLY" == "false" ]] && h2 "Token is not expired, using existing..."
  fi

  # Return token if requested
  if [[ "$TOKEN_ONLY" == "true" ]]; then
    jq -r '.auth.client_token' "$VAULT_TOKEN_FILE"
  fi
}
