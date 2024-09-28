FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

LABEL org.opencontainers.image.authors="Lucas Albino <lucas.albino@ee.ufcg.edu.br>"

RUN apt-get update && \
    apt-get install -y python3 python3-pip firefox git && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/smicallef/spiderfoot.git /app

WORKDIR /app

COPY start.sh /app/start.sh

RUN chmod +x /app/script.sh

RUN pip3 install -r requirements.txt

ENV DISPLAY=:0

CMD ["./script.sh"]
