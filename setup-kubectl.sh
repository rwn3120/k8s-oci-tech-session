#!/bin/bash -e

# usage
usage() {
    cat << EOL
${BIN} - OCI credentials setup

Usage:
    ${BIN} [OPTIONS]
Options:
    --tenancy=<value>      ... tenancy OCID (ocid1.tenancy...)
    --region=<value>       ... region name (us-phoenix-1, us-asburn-1, etc.)
    --user=<value>         ... user OCID (ocid1.user...)
    --key-file=<value>     ... path to OCI API key
    --passphrase=<value>   ... passphrase
    --fingerprint=<value>  ... fingerprint
    --cluster=<value>      ... cluster OCID (ocid1.cluster...)
EOL
}

for ARG in "${@}"; do
    ARG_VALUE="${ARG#*=}"
    case "${ARG}" in
        -h | --help | -?)
            usage
            exit 1;;
        --user=*)
            USER_OCID="${ARG_VALUE}";;
        --fingerprint=*)
            FINGERPRINT="${ARG_VALUE}";;
        --tenancy=*)
            TENANCY_OCID="${ARG_VALUE}";;
        --region=*)
            REGION="${ARG_VALUE}";;
        --passphrase=*)
            PASSPHRASE="${ARG_VALUE}";;
        --key-file=*)
            KEY_FILE="${ARG_VALUE}";;
        --cluster=*)
            CLUSTER="${ARG_VALUE}";;
        *)
            echo "${ARG} not supported. Run with -h to display usage." >&2
            exit 2;;
        esac
done

if [ "${USER_OCID}" == "" ]; then
    echo "Missing user OCID. Re-run with -h to display help"
    exit 3;
fi


if [ "${FINGERPRINT}" == "" ]; then
    echo "Missing fingerprint. Re-run with -h to display help"
    exit 3;
fi

if [ "${TENANCY_OCID}" == "" ]; then
    echo "Missing tenancy OCID. Re-run with -h to display help"
    exit 3;
fi

if [ "${REGION}" == "" ]; then
    echo "Missing region. Re-run with -h to display help"
    exit 3;
fi

if [ "${CLUSTER}" == "" ]; then
    echo "Missing cluster. Re-run with -h to display help"
    exit 3;
fi

if [ "${PASSPHRASE}" == "" ]; then
    echo "Missing passphrase. Re-run with -h to display help"
    exit 3;
fi

if [ "${KEY_FILE}" == "" ]; then
    echo "Missing key file. Re-run with -h to display help"
    exit 3;
fi

mkdir -p "oci"
cp "${KEY_FILE}" "oci/oci_api_key.pem"

cat << EOF > "oci/config"
[DEFAULT]
user=${USER_OCID}
fingerprint=${FINGERPRINT}
tenancy=${TENANCY_OCID}
region=${REGION}
pass_phrase=${PASSPHRASE}
key_file=/root/.oci/oci_api_key.pem
EOF

cat << EOF > "oci/cluster_ocid"
${CLUSTER}
EOF
