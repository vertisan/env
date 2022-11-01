commit() {
  BRANCH=$(git branch --show-current)
  REPOSITORY=$(git rev-parse --show-toplevel)
  IFS='-' read -r -A BRANCH_PARTS <<<"$BRANCH"
  NUM_REGEX='^[0-9]+$'
  JZ_PROJECT_DEFINITION="${REPOSITORY}/.jz-project.yml"
  JIRA_ID_DEFINITION="${REPOSITORY}/.jira"


  if [ -f $JZ_PROJECT_DEFINITION ]; then
    PROJECT_PREFIX=$(grep -A3 'jira:' $JZ_PROJECT_DEFINITION | tail -n1 | awk '{ print $2 }')
  elif [ -f $JIRA_ID_DEFINITION ]; then
    PROJECT_PREFIX=$(cat $JIRA_ID_DEFINITION)
  else
    PROJECT_PREFIX=""
  fi

  if [[ ${BRANCH} == "dev-ci" ]]; then
    COMMIT_MSG="CI/CD: $1"
  elif [[ ${BRANCH_PARTS[1]} == 'dev' ]] && [[ ${PROJECT_PREFIX} != "" ]]; then
    # If branch has a format: dev-{projectId}-{taskId}
    if [ "${#BRANCH_PARTS[@]}" -ge 3 ] && ! [[ ${BRANCH_PARTS[2]} =~ $NUM_REGEX ]] && [[ ${BRANCH_PARTS[3]} =~ $NUM_REGEX ]]; then

      COMMIT_MSG="${BRANCH_PARTS[2]:u}-$(printf %03d ${BRANCH_PARTS[3]})"

    # If branch has a format: dev-{taskId}
    elif [[ ${BRANCH_PARTS[2]} =~ $NUM_REGEX ]]; then
      COMMIT_MSG=$PROJECT_PREFIX

      for part in "${BRANCH_PARTS[@]}"; do
        if [[ ${part} =~ $NUM_REGEX ]]; then
          COMMIT_MSG+="-$(printf %03d $part)"
        fi
      done
    fi

#    if [ "${COMMIT_MSG}" != "" ]; then
#      COMMIT_MSG+=": $1"
#    else
#      COMMIT_MSG=$1
#    fi

  else
    COMMIT_MSG=$1
  fi

  if ask "Skip CI process?" N; then
    COMMIT_MSG+=" [skip-ci]"
  fi

  h1 "$COMMIT_MSG"
  if ask "Is that correct?" Y; then
    git commit -m "$COMMIT_MSG" "${@:2}"
  fi
}

commit() {
  v commit "$1"
}
