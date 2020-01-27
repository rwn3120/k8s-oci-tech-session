# Kubernetes @OCI/OKE (Tech session)

## Build image
```
docker build -t radowan/oke-kubectl .
```

## Setup kubectl configuration
1. Clone this repository or download `setup-kubectl.sh` script:
```
curl -sLO https://raw.githubusercontent.com/rwn3120/k8s-oci-tech-session/master/setup-kubectl.sh 
chmod +x setup-kubectl.sh
```
2. Run `setup-kubectl.sh`
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

