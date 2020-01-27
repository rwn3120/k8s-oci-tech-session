#!/bin/bash -e

if [ $# -lt 1 ]; then
    echo "Missing argument: path to templates" >&2
    exit 1
fi

TARGET="${PWD}/deployment"
mkdir -p "${TARGET}"
TEMPLATES=($(find "${@}" -iregex '.*\.\(yaml\|sh\)$' -print | sort | uniq))
if [ "${#TEMPLATES[@]}" -eq 0 ]; then
    echo "No template found!" >&2
    exit 2
fi
for TEMPLATE in "${TEMPLATES[@]}"; do
    echo "Processing ${TEMPLATE}"
    OUTPUT="${TARGET}/$(basename ${TEMPLATE})"
    sed "s/VAR_NAMESPACE/${USER}/g" "${TEMPLATE}" > "${OUTPUT}"
    if [[ "${OUTPUT##*.}" == "sh" ]]; then
        chmod +x "${OUTPUT}"
    fi
done

echo "Done. Processed ${#TEMPLATES[@]} templates."
