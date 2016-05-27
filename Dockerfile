FROM quay.io/experimentalplatform/ubuntu:latest

RUN apt-get update && \
    apt-get install -y dnsmasq && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD prep.sh /prep.sh
RUN chmod 755 /prep.sh

ENTRYPOINT ["/prep.sh"]

CMD ["dumb-init", "/usr/sbin/dnsmasq", "/etc/dnsmasq-private.conf"]