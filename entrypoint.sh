#!/bin/bash -eu

oci setup repair-file-permissions --file /root/.oci/config
oci setup repair-file-permissions --file /root/.oci/oci_api_key.pem 

oci ce cluster create-kubeconfig --cluster-id "$(cat "/root/.oci/cluster_ocid")"

"${@}"
