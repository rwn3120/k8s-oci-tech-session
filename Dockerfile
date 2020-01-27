FROM debian:buster-slim

ENV PATH="/root/bin:${PATH}"
RUN apt-get update && \
    apt-get -y install \
       vim nano curl \
       python3 python3-virtualenv && \
    apt-get clean && \
    \
    curl "https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.sh" -o oci-cli-install.sh && \
    chmod +x oci-cli-install.sh && \
    ./oci-cli-install.sh --accept-all-defaults && \
    rm oci-cli-install.sh && \
    \
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s "https://storage.googleapis.com/kubernetes-release/release/stable.txt")/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

COPY entrypoint.sh /usr/local/bin/

WORKDIR /root

ENTRYPOINT ["entrypoint.sh"]
CMD ["bash"]

