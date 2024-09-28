FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y

COPY data .

RUN chmod +x data

CMD ["./data"]

LABEL maintainer="Densenvolvido por, Lucas Rodrigues Albino"
