FROM alpine:3.18

RUN apk update && apk add --no-cache redis

COPY conf/redis.conf /etc/redis.conf

CMD ["redis-server", "/etc/redis.conf"]
