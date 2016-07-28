#!/bin/sh
set -ex

# Work around rancherOS weirdness
rm -f /var/run/rsyslogd.pid

if [ -e /host/dev ]; then
    mount --rbind /host/dev /dev
fi

CA_BASE=/etc/ssl/certs/ca-certificates.crt.rancher
CA=/etc/ssl/certs/ca-certificates.crt

if [[ -e ${CA_BASE} && ! -e ${CA} ]]; then
    cp $CA_BASE $CA
fi

echo "*.* @@${LOG_DESTINATION}" >> /etc/rsyslog.conf
exec "$@"
