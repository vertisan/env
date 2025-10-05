commit() {
  TYPES=("feat" "fix" "docs" "style" "refactor" "test" "chore" "revert")
  MESSAGE=$1

  TYPE=$(gum filter ${TYPES} --limit 1)
  if [[ $? -eq 124 ]]; then
    h2 "Cancelling..."
    return
  fi

  SCOPE=$(gum input --placeholder "scope")
  if [[ $? -eq 124 ]]; then
    h2 "Cancelling..."
    return
  fi

  test -n "${SCOPE}" && SCOPE="(${SCOPE})"

  if [[ ${MESSAGE} == "" ]]; then
    MESSAGE=$(gum input --value "${TYPE}${SCOPE}: ${MESSAGE}" --placeholder "Summary of the changes...")

    if [[ $? -eq 124 ]]; then
      h2 "Cancelling..."
      return
    fi
  else
    MESSAGE="${TYPE}${SCOPE}: ${MESSAGE}"
  fi

  h1 "${MESSAGE}"
  gum confirm "Commit changes?" && git commit --message "${MESSAGE}"
}
