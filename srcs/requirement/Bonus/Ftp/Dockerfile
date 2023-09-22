FROM alpine:3.18

RUN apk update && apk add --no-cache vsftpd lftp

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

#CMD tail -f /dev/null
CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
