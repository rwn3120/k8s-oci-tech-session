#!/bin/bash

kubectl config set-context --current --namespace=${1:-VAR_NAMESPACE}
