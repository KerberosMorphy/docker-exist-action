FROM docker:dind

RUN mkdir -p /root/.docker && echo '{"experimental": "enabled"}' > /root/.docker/config.json
# RUN mkdir -p /etc/docker && echo '{"experimental": true}' > /etc/docker/daemon.json

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
