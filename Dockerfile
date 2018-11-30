FROM postgres

RUN apt-get update && apt-get install -y unzip

ADD https://releases.hashicorp.com/consul/0.5.2/consul_0.5.2_linux_amd64.zip /tmp/consul.zip

RUN cd /bin && \
    unzip /tmp/consul.zip&& \
    chmod +x /bin/consul && \
    mkdir -p {/data/consul,/etc/consul.d} && \
    rm /tmp/consul.zip

ADD postgres.json /etc/consul.d/postgres.json
COPY postgres_init.sh /docker-entrypoint-initdb.d/10-postgres_init.sh
COPY consulagent_join.sh /docker-entrypoint-initdb.d/20-consulagent_join.sh

RUN rm /docker-entrypoint.sh
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
