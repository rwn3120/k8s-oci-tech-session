# Kubernetes @OCI/OKE (Tech session)

## Build image
```
docker build -t radowan/oke-kubectl .
```

## Setup kubectl configuration
```
./setup-kubectl.sh \
    --region="us-phoenix-1" \
    --tenancy="ocid1.tenancy.xxx..yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy" \
    --user="ocid1.user.xxx..yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy" \
    --fingerprint="aa:bb:cc:dd:ee:ff:00:11:22:33:44:55:66:77:88:99" \
    --passphrase="super-secret" \
    --key-file="/tmp/oci_api_key.pem" \
    --cluster="ocid1.cluster.xxx.yyy.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
```
## Start container
```
docker run -it --rm -v "$(pwd)/oci:/root/.oci" radowan/oke-kubectl
```

