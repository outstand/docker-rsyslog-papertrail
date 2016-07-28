FROM alpine:3.4
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN apk add --no-cache curl rsyslog rsyslog-tls && \
    echo 'ba3b40a34ec33ac0869fa5b17a0c80fc  /etc/papertrail-bundle.pem' > /tmp/papertrail-bundle.md5 && \
    curl -o /etc/papertrail-bundle.pem https://papertrailapp.com/tools/papertrail-bundle.pem && \
    md5sum -c /tmp/papertrail-bundle.md5 && \
    rm /tmp/papertrail-bundle.md5 && \
    apk del curl
COPY rsyslog.conf /etc/rsyslog.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh
CMD ["rsyslogd", "-n"]
ENTRYPOINT ["/docker-entrypoint.sh"]
