FROM lapsiufcg/ubuntu2204-systemd:v0.1

LABEL org.opencontainers.image.authors="Fernando Barros, <fernando.barros@ee.ufcg.edu.br>"

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:oisf/suricata-stable \
    && apt-get update \
    && apt-get install -y suricata jq iproute2 nano curl libpcre2-dev rustc cargo iptables \
                          libpcre3 libpcre3-dbg libpcre3-dev build-essential autoconf automake libtool libpcap-dev libnet1-dev libyaml-0-2 libyaml-dev \
                          zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 make libmagic-dev libjansson-dev libjansson4 pkg-config libnetfilter-queue-dev \
                          libnetfilter-queue1 libnfnetlink-dev libnfnetlink0 ufw inetutils-ping

COPY /conf/suricata.conf /root/suricata.conf
