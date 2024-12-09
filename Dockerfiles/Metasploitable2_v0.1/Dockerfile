FROM lapsiufcg/metasploitable2:v0.1

LABEL maintainer="Fernando Barros, <fernando.barros@ee.ufcg.edu.br>"
LABEL version="v0.1"

RUN apt-get update
RUN apt-get install -y hping3 timeout ufw openssh-server openssh-client

COPY scripts/rockYou/ rockYou/
 



