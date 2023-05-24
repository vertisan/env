branch() {
  BRANCH=$1
  if [ "$BRANCH" = "" ]; then
    BRANCH=$(git branch -a | fzf | sed 's:.*/::' | sed 's/\*\s//g' | xargs)
  fi

  h1 "Switching branch into '${BRANCH}'..."
  git checkout "${BRANCH}"
  git pull
  git lfs pull || h2 "Git LFS is not configured, ignoring..."
}
