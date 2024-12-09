FROM lapsiufcg/ubuntu2204-systemd:v0.1

RUN apt-get -y update && apt-get install -y net-tools

COPY velociraptor-v0.72.0-linux-amd64 client.config.yaml /clients/
COPY malware.sh /root/

RUN chmod +x /clients/velociraptor-v0.72.0-linux-amd64

