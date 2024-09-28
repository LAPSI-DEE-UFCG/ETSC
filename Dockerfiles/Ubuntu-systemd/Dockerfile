FROM ubuntu:22.04

LABEL org.opencontainers.image.authors="Fernando Barros, <fernando.barros@ee.ufcg.edu.br>"

RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session ufw nano inetutils-ping
RUN printf "systemctl start systemd-logind" >> /etc/profile

ENTRYPOINT ["/sbin/init"]
