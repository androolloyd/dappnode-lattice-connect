FROM node:15.8.0-alpine

WORKDIR /opt/lattice

RUN apk add --no-cache unbound-dev bash gmp-dev g++ gcc make python2 git \
 && git clone https://github.com/GridPlus/wallet-web.git /opt/lattice \
 && npm install && npm run build && npm install -g serve


EXPOSE 3000

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh"]
