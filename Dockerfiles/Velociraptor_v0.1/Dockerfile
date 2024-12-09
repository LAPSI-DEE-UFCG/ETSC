FROM lapsiufcg/velociraptor:v0.1

LABEL org.opencontainers.image.authors="Lucas Albino <lucas.albino@ee.ufcg.edu.br>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y firefox

ENV DISPLAY=:0

CMD ["firefox"]
