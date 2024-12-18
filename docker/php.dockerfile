FROM php:7.4.33-fpm-alpine3.16

RUN apk add --no-cache git openssh-client

# RUN ssh-keygen -t rsa -b 4096 -C "test@example.com" -N "" -f /root/.ssh/id_rsa

COPY id_rsa_gitlab /root/.ssh/id_rsa
COPY id_rsa_gitlab.pub /root/.ssh/id_rsa.pub
COPY known_hosts /root/.ssh/known_hosts

RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 644 /root/.ssh/id_rsa.pub

RUN cat /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub