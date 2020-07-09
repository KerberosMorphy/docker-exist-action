FROM docker:dind

RUN mkdir -p /etc/docker && echo '{"experimental": true}' > /etc/docker/daemon.json

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
