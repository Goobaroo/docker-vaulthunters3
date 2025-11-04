# syntax=docker/dockerfile:1

FROM eclipse-temurin:17-jdk

LABEL version="3.19.6.4"
LABEL homepage.group=Minecraft
LABEL homepage.name="Vault Hunters Official Pack (3rd Ed.)-3.19.6.4"
LABEL homepage.icon="https://media.forgecdn.net/avatars/1477/93/638958872312463958.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://VaultHunters3rdEdition:25565

RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV JAVA_OPTS "-Xms4096m -Xmx4096m"

CMD ["/launch.sh"]