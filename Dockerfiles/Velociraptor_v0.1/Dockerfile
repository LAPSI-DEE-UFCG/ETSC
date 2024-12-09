FROM lapsiufcg/velociraptor:v0.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y firefox

ENV DISPLAY=:0

CMD ["firefox"]
