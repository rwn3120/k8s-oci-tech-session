#!/bin/bash -eu

export OCI_CLI_SUPPRESS_FILE_PERMISSIONS_WARNING="true"

/root/lib/oracle-cli/bin/oci setup repair-file-permissions --file /root/.oci/config
/root/lib/oracle-cli/bin/oci ce cluster create-kubeconfig --cluster-id "$(cat "/root/.oci/cluster_ocid")"

"${@}"
