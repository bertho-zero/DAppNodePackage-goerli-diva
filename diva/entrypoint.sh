#!/bin/sh

case $_DAPPNODE_GLOBAL_EXECUTION_CLIENT_PRATER in
"goerli-geth.dnp.dappnode.eth")
  EXECUTION_CLIENT_URL="ws://goerli-geth.dappnode:8546"
  ;;
"goerli-nethermind.dnp.dappnode.eth")
  EXECUTION_CLIENT_URL="ws://goerli-nethermind.dappnode:8546"
  ;;
"goerli-besu.dnp.dappnode.eth")
  EXECUTION_CLIENT_URL="ws://goerli-besu.dappnode:8546"
  ;;
"goerli-erigon.dnp.dappnode.eth")
  EXECUTION_CLIENT_URL="ws://goerli-erigon.dappnode:8545"
  ;;
*)
  echo "Unknown value for _DAPPNODE_GLOBAL_EXECUTION_CLIENT_PRATER: $_DAPPNODE_GLOBAL_EXECUTION_CLIENT_PRATER"
  EXECUTION_CLIENT_URL=$_DAPPNODE_GLOBAL_EXECUTION_CLIENT_PRATER
  ;;
esac

case $_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER in
"prysm-prater.dnp.dappnode.eth")
  CONSENSUS_CLIENT_URL="http://beacon-chain.prysm-prater.dappnode:3500"
  ;;
"teku-prater.dnp.dappnode.eth")
  CONSENSUS_CLIENT_URL="http://beacon-chain.teku-prater.dappnode:3500"
  ;;
"lighthouse-prater.dnp.dappnode.eth")
  CONSENSUS_CLIENT_URL="http://beacon-chain.lighthouse-prater.dappnode:3500"
  ;;
"nimbus-prater.dnp.dappnode.eth")
  CONSENSUS_CLIENT_URL="http://beacon-validator.nimbus-prater.dappnode:4500"
  ;;
"lodestar-prater.dnp.dappnode.eth")
  CONSENSUS_CLIENT_URL="http://beacon-chain.lodestar-prater.dappnode:3500"
  ;;
*)
  echo "Unknown value for _DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER: $_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER"
  EXECUTION_CLIENT_URL=$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_PRATER
  ;;
esac

divad \
  --db=/opt/diva/data/diva.db \
  --w3s-address=0.0.0.0 \
  --execution-client-url=${EXECUTION_CLIENT_URL} \
  --consensus-client-url=${CONSENSUS_CLIENT_URL} \
  --tracing \
  --log-level=debug \
  --swagger-ui-enabled \
  --contract=0xf73280D617AB4BDff2558adcD1a1659ccD1B4fF9 \
  --master-key=${DIVA_API_KEY} \
2>&1 | tee /var/log/divad/divad.log
