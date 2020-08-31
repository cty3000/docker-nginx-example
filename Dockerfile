FROM scratch

COPY --from=nginx:mainline-alpine / /

RUN apk add --no-cache curl

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh
COPY nginx.conf.template /etc/nginx/nginx.conf.template

RUN touch /var/run/nginx.pid \
 && mkdir -p /var/cache/nginx/client_temp \
 && chown -R nginx /var/cache/nginx /var/run/nginx.pid

STOPSIGNAL SIGTERM

ENV ORIGIN origin:8080
ENV PORT 8080
ENV SSL_PORT 8443

EXPOSE 8080/tcp
EXPOSE 8443/tcp

USER root

ENTRYPOINT ["/app/entrypoint.sh"]
