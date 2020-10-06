# Based on https://github.com/opencultureconsulting/openrefine-docker/blob/master/3.4/Dockerfile

FROM openjdk:8-jre-alpine
LABEL maintainer="rodrigo.barnes@aridhia.com"

# OpenRefine 3.3 is required for the RDF plugin
ENV OR_URL https://github.com/OpenRefine/OpenRefine/releases/download/3.3/openrefine-linux-3.3.tar.gz

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl grep tar \
    && curl -sSL ${OR_URL} | tar xz --strip 1

RUN addgroup -S workspace && adduser -G workspace -D workspace
RUN su workspace -c "mkdir -p /home/workspace/files"

# /files is mounted from the Workspace file system 
# VOLUME /home/workspace/files/openrefine
# WORKDIR /home/workspace/files/openrefine

# Required for the Workspace integrations
EXPOSE 8080
ENV SHINY_DIR=openrefine

# Entry point wraps up openrefine CLI
ADD mini-app /usr/bin/

USER workspace
WORKDIR /home/workspace

# RUN chmod 777 /home/workspace
ENTRYPOINT /usr/bin/mini-app

