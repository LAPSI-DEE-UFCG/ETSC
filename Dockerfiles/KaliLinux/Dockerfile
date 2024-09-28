FROM gns3/kalilinux

LABEL org.opencontainers.image.authors="Fernando Barros, <fernando.barros@ee.ufcg.edu.br>"

RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session
RUN printf "systemctl start systemd-logind" >> /etc/profile

RUN apt-get install -y metasploit-framework hydra netdiscover nmap set \
	nano hping3 net-tools netcat-traditional inetutils-ping \
	proxychains rdesktop python3 python3-pip telnet telnetd beef-xss 

ENTRYPOINT ["/sbin/init"]
