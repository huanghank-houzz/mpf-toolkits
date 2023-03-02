#!/bin/bash

# Default values for variables
LOGIN="KUBECONFIG=${HOME?}/teleport.yaml tsh login --proxy=teleport.k8s-mgmt.stghouzz.com:443 --auth=github && "
EXPORT="export KUBECONFIG=${HOME?}/teleport.yaml && "
NEED_LOGIN=false

NAMESPACE="c2-codepath"
CLUSTER=""
POD_NAME=""

CMD=""

# Parsing options
while getopts ":lrpsci:" opt; do
  case ${opt} in
    r )
      NAMESPACE="backend -c rq-worker-container"
      ;;
    p )
      CLUSTER="k8s1.houzz.net"
      ;;
    s )
      CLUSTER="k8s.stghouzz.com"
      ;;
    c )
      CLUSTER="k8s-houzz.stghouzz.com"
      ;;
    l )
      # login first
      CMD+=$LOGIN
      CMD+=$EXPORT
      ;;
    i )
      # login first
      POD_NAME=$OPTARG
      ;;
    \? )
      echo "Invalid option: -$OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

# Reading input variable
if [ "$POD_NAME" == "" ]; then
  echo "No input any pod name !!"
  exit 1
fi

if [ "$LOGIN_CLUSTER" == "" ]; then
  echo "No input any CLUSTER !!"
  exit 1
fi

if [ "$LOGIN_POD" == "" ]; then
  echo "No input any NAMESPACE !!"
  exit 1
fi

# Composing login cluster command
LOGIN_CLUSTER="tsh kube login $CLUSTER && "

# Composing login pods command
LOGIN_POD="kubectl exec -it $POD_NAME -n $NAMESPACE -- /bin/bash"

# Composing final command
# 1. login admin
# 2. login cluster
# 3. into the pods
CMD+=$LOGIN_CLUSTER
CMD+=$LOGIN_POD


# echo "Running command: $CMD"
eval $CMD