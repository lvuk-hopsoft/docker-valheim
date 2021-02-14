FROM steamcmd/steamcmd:latest

RUN apt-get update && \
	apt-get -y install --no-install-recommends libsdl2-2.0-0:i386 && \
	rm -rf /var/lib/apt/lists/*


RUN mkdir -p /home/valheim/data/ && ulimit -n 2048

WORKDIR /home/valheim

ADD entrypoint.sh /home/valheim/entrypoint.sh
ADD start-server.sh /home/valheim/start-server.sh

RUN chmod +x /home/valheim/entrypoint.sh && chmod +x /home/valheim/start-server.sh

ENV SERVER_NAME="Valheim Server"
ENV SERVER_PASSWORD="654321"
ENV SERVER_WORLD="World"
ENV SERVER_PORT=22456
ENV SAVE_DIR="/home/valheim/saves"

VOLUME /home/valheim/data
VOLUME /home/valheim/saves

ENTRYPOINT  ["/bin/sh", "entrypoint.sh"]

CMD ["/bin/sh", "start-server.sh", "-n"]
