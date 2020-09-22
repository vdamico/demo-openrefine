# Based on https://github.com/opencultureconsulting/openrefine-docker/blob/master/3.4/Dockerfile

FROM openjdk:8-jre-alpine
LABEL maintainer="felixlohmeier@opencultureconsulting.com"
# OpenRefine 3.3

ENV OR_URL https://github.com/OpenRefine/OpenRefine/releases/download/3.4/openrefine-linux-3.4.tar.gz

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl grep tar \
    && curl -sSL ${OR_URL} | tar xz --strip 1

VOLUME /files
WORKDIR /files/openrefine

EXPOSE 8080

ENTRYPOINT ["/app/refine"]
CMD ["-i", "0.0.0.0", "-p", "8080", "-d", "/data"]
