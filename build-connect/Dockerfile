FROM node:12-alpine

WORKDIR /opt/lattice

ARG RELEASE_TAG

RUN apk add bash git \
 && git clone --branch ${RELEASE_TAG} https://github.com/GridPlus/lattice-connect.git /opt/lattice \
 && npm install && npm run build

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh"]
