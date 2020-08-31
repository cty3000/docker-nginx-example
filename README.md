# nginx

## Create docker image

    $ docker build -t docker-nginx .

## Try it out

    $ docker run -it \
        -e ORIGIN=$ORIGIN:8080 \
        -e PORT=8080 -e SSL_PORT=8443 \
        -e BASE64_CA_CERT=$(cat keys/ca.crt|base64) \
        -e BASE64_SERVER_CERT=$(cat keys/server.crt|base64) \
        -e BASE64_SERVER_CERT_KEY(cat keys/server.key|base64) \
        -p8080:8080/tcp \
        docker-nginx
