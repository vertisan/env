kka() {
  kustomize build --enable-helm --enable-alpha-plugins --enable-exec $1 | k apply -f -
}

kkas() {
  kustomize build --enable-helm --enable-alpha-plugins --enable-exec $1 | k apply -f - --server-side
}

kkdel() {
  kustomize build --enable-helm --enable-alpha-plugins --enable-exec $1 | k delete -f -
}

kc() {
  CONTEXT=$(cat ~/.kube/config | yq '.contexts.[].name' | fzf)

  h2 "Switching K8s context to '$CONTEXT'..."
  kubectl config use-context $CONTEXT
}
