branch() {
  BRANCH=$1

  if [[ ${BRANCH} == "" ]]; then
    BRANCH=$(git branch -a | cut -c 3- | gum filter --limit 1 --placeholder "Select branch...")

    if [[ $? -eq 124 ]]; then
      h2 "Cancelling..."
      return
    fi
  fi

  h1 "Switching branch into '${BRANCH}'..."
  git checkout "${BRANCH}"
  git pull
  git lfs pull || h2 "Git LFS is not configured, ignoring..."
}
