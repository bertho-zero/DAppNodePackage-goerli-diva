#!/bin/bash

exec -c validator \
  --accept-terms-of-use \
  --beacon-rpc-provider="${BEACON_RPC_PROVIDER}" \
  --monitoring-host=0.0.0.0 \
  --validators-external-signer-public-keys="http://diva.goerli-diva.public.dappnode:9000/api/v1/eth2/publicKeys" \
  --validators-external-signer-url="http://diva.goerli-diva.public.dappnode:9000" \
  --web \
  --wallet-dir=/jwt \
  --grpc-gateway-host=0.0.0.0
