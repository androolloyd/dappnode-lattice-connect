#!/bin/bash

export REACT_APP_BASE_SIGNING_URL=relay.lattice-connect.public.dappnode
export REACT_APP_GRIDPLUS_CLOUD_API=relay.lattice-connect.public.dappnode:3000

bash -c "serve -s build -l ${WEB_APP_LADDR:-3000}"
