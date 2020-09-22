# Based on https://github.com/opencultureconsulting/openrefine-docker/blob/master/3.4/Dockerfile

FROM openjdk:8-jre-alpine
LABEL maintainer="rodrigo.barnes@aridhia.com"

# OpenRefine 3.4
ENV OR_URL https://github.com/OpenRefine/OpenRefine/releases/download/3.4/openrefine-linux-3.4.tar.gz

WORKDIR /app

RUN set -xe \
    && apk add --no-cache bash curl grep tar \
    && curl -sSL ${OR_URL} | tar xz --strip 1

# /files is mounted from the Workspace file system 
VOLUME /home/workspace/files/openrefine
WORKDIR /home/workspace/files/openrefine
# Required for the Workspace integrations
EXPOSE 8080

ENTRYPOINT ["/app/refine"]
# Serve on all IPs and port 8080 for Workspace integration
CMD ["-i", "0.0.0.0", "-p", "8080", "-d", "/home/workspace/files/openrefine/data"]
