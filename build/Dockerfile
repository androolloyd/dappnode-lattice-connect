FROM node:15.8.0-alpine

WORKDIR /opt/lattice

RUN apk add --no-cache unbound-dev bash gmp-dev g++ gcc make python2 git
RUN git clone https://github.com/GridPlus/lattice-connect.git /opt/lattice
RUN npm install && npm run build


EXPOSE 3000
EXPOSE 1883

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh"]
