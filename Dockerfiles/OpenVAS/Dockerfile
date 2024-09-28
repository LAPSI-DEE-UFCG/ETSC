FROM mikesplain/openvas

RUN apt-get update && apt-get install -y firefox

COPY /app/script.sh script.sh

RUN chmod +x script.sh

ENV DISPLAY=:0

CMD ["./script.sh"]
