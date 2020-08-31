#!/bin/sh -e

envsubst '\
    $$ORIGIN \
    $$PORT \     
    $$SSL_PORT \
    '< /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

mkdir -p /etc/nginx/keys
echo $BASE64_CA_CERT | base64 -d > /etc/nginx/keys/ca.crt
echo $BASE64_SERVER_CERT | base64 -d > /etc/nginx/keys/server.crt
echo $BASE64_SERVER_CERT_KEY | base64 -d > /etc/nginx/keys/server.key

/usr/sbin/nginx -g 'daemon off;'
