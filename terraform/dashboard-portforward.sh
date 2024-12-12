#!/bin/bash
kubectl --kubeconfig=eoc2024-cluster-kubeconfig -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
