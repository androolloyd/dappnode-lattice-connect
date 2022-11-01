FROM ubuntu:22.04 AS base

RUN apt-get update && \
    apt-get install -y curl git

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

FROM base AS builder

WORKDIR /build/lattice-connect-v2

ARG RELEASE_TAG=main

RUN git clone https://github.com/GridPlus/lattice-connect-v2.git /build/lattice-connect-v2 \
 && git checkout ${RELEASE_TAG} && cd connect && npm i && npx tsc --build tsconfig.json \
 && npm prune --production && rm -rf node_modules/typescript

FROM node:16-alpine AS app
RUN apk add --no-cache bash
COPY --from=builder /build/lattice-connect-v2/connect/dist /app/dist
COPY --from=builder /build/lattice-connect-v2/connect/node_modules /app/node_modules

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["bash", "/usr/local/bin/docker-entrypoint.sh"]
