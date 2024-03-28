unalias tf 2>/dev/null

tf() {
  GIT_ROOT_DIR=$(git rev-parse --show-toplevel || exit 0)
  CUSTOM_TERRAFORM_BIN="$GIT_ROOT_DIR/terraform.local"

  if [ -f "$CUSTOM_TERRAFORM_BIN" ]; then
    h1 "! Using a custom Terraform binary!"

    $CUSTOM_TERRAFORM_BIN $*
  else
    terraform $*
  fi
}
