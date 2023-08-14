ARG UPSTREAM_VERSION

FROM diva/diva:${UPSTREAM_VERSION}

WORKDIR /opt/diva/

RUN apk update && apk add logrotate

RUN  mkdir -p /var/log/divad

COPY logrotate.conf /etc/logrotate.d/divad
COPY entrypoint.sh /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

#ENTRYPOINT ["divad"]

#CMD "mkdir -p data && divad --db=/opt/diva/data/diva.db --w3s-address=0.0.0.0 --execution-client-url=ws://192.168.1.145:8546 --consensus-client-url=http://192.168.1.145:3600 --tracing --log-level=debug --contract=0xf73280D617AB4BDff2558adcD1a1659ccD1B4fF9 --master-key=azerty"

#CMD "--db=/opt/diva/data/diva.db \
#  --w3s-address=0.0.0.0 \
#  --execution-client-url=${EXECUTION_CLIENT_URL} \
#  --consensus-client-url=${CONSENSUS_CLIENT_URL} \
#  --tracing \
#  --log-level=debug \
#  --contract=0xf73280D617AB4BDff2558adcD1a1659ccD1B4fF9 \
#  --master-key=${DIVA_API_KEY}"
