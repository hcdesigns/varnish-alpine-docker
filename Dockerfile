FROM alpine:3.7

LABEL maintainer="Harvey Chow <harvey@hcdesigns.nl>"

ENV VARNISH_BACKEND_ADDRESS 192.168.10.10
ENV VARNISH_MEMORY 1G
ENV VARNISH_BACKEND_PORT 80

EXPOSE 80
EXPOSE 6081
EXPOSE 6082

RUN apk update && \
    apk upgrade && \
    apk add varnish

ADD start.sh /start.sh
CMD ["/start.sh"]