#!/bin/sh

mkdir -p /var/lib/varnish/`hostname` && chown nobody /var/lib/varnish/`hostname`
varnishd -s malloc,${VARNISH_MEMORY} \
    -T :6082 -a :80 \
    -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on -p cli_buffer=16384 \
    -S /etc/varnish/secret \
    -f /etc/varnish/default.vcl
sleep 1
varnishlog
