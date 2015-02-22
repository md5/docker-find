FROM jpetazzo/dind
ENV DOCKER_HOST unix:///tmp/docker.sock
COPY docker-find /sbin/
ENTRYPOINT ["docker-find"]
