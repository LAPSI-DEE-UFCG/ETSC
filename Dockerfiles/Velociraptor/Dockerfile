FROM lapsiufcg/velociraptor:v0.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y firefox

ENV DISPLAY=:0

CMD ["firefox"]