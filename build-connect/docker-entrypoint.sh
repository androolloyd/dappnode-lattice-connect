#!/bin/bash


#delete default config

if [[ -z $PUBLIC_ADDRESS ]]; then
 PUBLIC_ADDRESS=$_DAPPNODE_GLOBAL_HOSTNAME
fi

cat > config.js << EOF
module.exports = {
  APP_HOST: "0.0.0.0",
  APP_PORT: ${APP_RPC_LADDR:-3000},
  LOG_DEST: '/tmp/lattice-connector.log',
  LOG_LEVEL: '${LOG_LEVEL:-debug}', // trace, debug, info, warn, error
  MQTT: {
    CLIENT_ID: '${PUBLIC_ADDRESS}',
    USERNAME: '${BROKER_USERNAME}',
    PASSWORD: '${BROKER_PASSWORD}',
    BROKER_PORT: ${MQTT_BROKER_LADDR:-1883},
  },
  TIMEOUT_ITER_MS: 500,
  TIMEOUT_TOTAL_MS: 60000,
}
EOF

set -ex

(cd /opt/lattice && node dist/index.js --name lattice-connect --watch)
