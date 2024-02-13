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

exec -c divad \
  --db=/opt/diva/data/diva.db \
  --w3s-address=0.0.0.0 \
  --execution-client-url="${EXECUTION_CLIENT_URL}" \
  --consensus-client-url="${CONSENSUS_CLIENT_URL}" \
  --tracing \
  --log-level=debug \
  --swagger-ui-enabled \
  --contract=0xf73280D617AB4BDff2558adcD1a1659ccD1B4fF9 \
  --master-key="${DIVA_API_KEY}" \
  --genesis-time=1616508000 \
  --gvr=0x043db0d9a83813551ee2f33450d23797757d430911a9320530ad8a0eabc43efb \
  --genesis-fork-version=0x00001020 \
  --current-fork-version=0x04001020 \
  --deposit-contract=0xff50ed3d0ec03ac01d4c79aad74928bff48a7b2b \
  --chain-id=5 \
2>&1 | tee /var/log/divad/divad.log
