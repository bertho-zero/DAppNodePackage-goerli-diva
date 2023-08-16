#!/bin/bash

case $_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER in
"prysm-prater.dnp.dappnode.eth")
  BEACON_RPC_PROVIDER="beacon-chain.prysm-prater.dappnode:4000"
  ;;
"teku-prater.dnp.dappnode.eth")
  BEACON_RPC_PROVIDER="beacon-chain.teku-prater.dappnode:4000"
  ;;
"lighthouse-prater.dnp.dappnode.eth")
  BEACON_RPC_PROVIDER="beacon-chain.lighthouse-prater.dappnode:4000"
  ;;
"nimbus-prater.dnp.dappnode.eth")
  BEACON_RPC_PROVIDER="beacon-validator.nimbus-prater.dappnode:4500"
  ;;
"lodestar-prater.dnp.dappnode.eth")
  BEACON_RPC_PROVIDER="beacon-chain.lodestar-prater.dappnode:4000"
  ;;
*)
  echo "Unknown value for _DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER: $_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER"
  BEACON_RPC_PROVIDER=$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER
  ;;
esac

exec -c validator \
  --accept-terms-of-use \
  --beacon-rpc-provider="${BEACON_RPC_PROVIDER}" \
  --monitoring-host=0.0.0.0 \
  --validators-external-signer-public-keys="http://diva.goerli-diva.public.dappnode:9000/api/v1/eth2/publicKeys" \
  --validators-external-signer-url="http://diva.goerli-diva.public.dappnode:9000" \
  --web \
  --wallet-dir=/jwt \
  --grpc-gateway-host=0.0.0.0 \
  --graffiti="Diva operator"
