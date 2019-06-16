#!/bin/sh

kaliases(){
  cat $HOME/dotfiles/system/functions/kubernetes.sh
}

kset-namespace(){
  namespace=$1
  export KUBE_NAMESPACE=$namespace
  echo $KUBE_NAMESPACE
}

knamespace(){
  echo $KUBE_NAMESPACE
}

kset-context(){
  context=$1
  k config use-context $context
}

kcontext(){
  kubectl config current-context
}

kcontexts(){
  kubectl config get-contexts
}

kconfig(){
  kubectl config view
}

connect-pod(){
  pod_name=$1
  kubectl exec -it $pod_name -n $KUBE_NAMESPACE -c web /bin/sh
}

connect-namespace-pod() {
  pod_name=$1
  namespace=$2
  kubectl exec -it $pod_name -n $namespace -c web /bin/sh
}

pods() {
  namespace=$1
  
  if [[ -n $namespace ]]; then
    kubectl get pods -n $namespace
  else
    kubectl get pods -n $KUBE_NAMESPACE
  fi
}

filter-pods(){
  filter_by=$1
  kubectl get pods -n $KUBE_NAMESPACE | grep $filter_by
}

delete-pod(){
  pod=$1
  kubectl delete -n $KUBE_NAMESPACE pod $pod
}