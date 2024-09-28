# Baseado em uma imagem Ubuntu com ferramentas básicas
FROM ubuntu:16.04

# Metadados do container
LABEL maintainer="Fernando Barros, <fernando.barros@ee.ufcg.edu.br>"
LABEL version="v0.1"
LABEL description="Container para executar o GrassMarlin com suporte à interface gráfica e redimensionamento de janela"

RUN apt update && apt install -y nmap telnet

# Instalação de um init simples e pacotes necessários
ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/sbin/dumb-init

RUN set -ex \
    && chmod 755 /usr/local/sbin/dumb-init \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
        jwm lxterminal menu openjdk-8-jdk libcanberra-gtk-module \
        libpcap-dev xdg-utils libxrender1 libxtst6 libxi6 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/.config/lxterminal \
    && /bin/echo -e '\
[general]\n\
scrollback=1000\n\
fgcolor=#ffffff' \
        > /root/.config/lxterminal/lxterminal.conf \
    && /bin/echo -e '\
\x23!/bin/sh\n\
[ $$ -eq 1 ] && exec dumb-init "$0" "$@"\n\
\n\
cd\n\
export SHELL=/bin/bash\n\
grassmarlin &\n\
jwm' \
        > /etc/init.sh && chmod +x /etc/init.sh

# Copia o pacote .deb do GrassMarlin para dentro do container
COPY app/grassmarlin_3.2.1.ubuntu1604-1_amd64.deb /tmp/grassmarlin.deb

# Instala o GrassMarlin
RUN dpkg -i /tmp/grassmarlin.deb && rm /tmp/grassmarlin.deb

# Configura o volume e o comando de inicialização
VOLUME [ "/root" ]
CMD [ "/etc/init.sh" ]
