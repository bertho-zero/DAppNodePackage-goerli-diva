#!/bin/sh

divad \
  --db=/opt/diva/data/diva.db \
  --w3s-address=0.0.0.0 \
  --execution-client-url=${EXECUTION_CLIENT_URL} \
  --consensus-client-url=${CONSENSUS_CLIENT_URL} \
  --tracing \
  --log-level=debug \
  --contract=0xf73280D617AB4BDff2558adcD1a1659ccD1B4fF9 \
  --master-key=${DIVA_API_KEY} \
2>&1 | tee /var/log/divad/divad.log
