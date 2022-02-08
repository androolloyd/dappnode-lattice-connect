FROM node:12-alpine

WORKDIR /opt/lattice

ARG RELEASE_TAG

RUN apk add --no-cache unbound-dev bash gmp-dev g++ gcc make python2 git \
 && git clone --branch ${RELEASE_TAG} https://github.com/GridPlus/lattice-connect.git /opt/lattice \
 && npm install && npm run build

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000
EXPOSE 1883

ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh"]
