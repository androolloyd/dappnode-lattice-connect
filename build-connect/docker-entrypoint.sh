#!/bin/bash

set -ex

export ADMIN_CLIENT_HOST=http://${LATTICE_NAME}

export NODE_ENV=production

node /app/dist/direct.js
