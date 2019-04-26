#!/bin/sh

pod_connect() {
  pod_name=$1
  kubectl exec -it $pod_name -- /bin/bash
}

pod_select() {
  shipment=$1
  app=$2
  
  if [[ -n $app ]]; then
    kubectl get pods --selector=shipment=$shipment,app=$app
  else
    kubectl get pods --selector=shipment=$shipment
  fi
}

pcr_pods() {
  shipment=$1
  pod_select $shipment procore-reporting
}
