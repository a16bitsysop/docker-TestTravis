FROM alpine:edge as builder

RUN apk add --update-cache alpine-conf alpine-sdk sudo \
&& apk upgrade -a
RUN adduser -D builduser \
    && addgroup builduser abuild \
    && echo 'builduser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
USER builduser
WORKDIR /home/builduser

COPY pull-patch.sh /usr/local/bin
COPY APKBUILD.patch ./
COPY newfiles/* ./newfiles/

RUN abuild-keygen -a -i -n \
&& sudo install -d -o builduser -g builduser "$HOME"/.abuild/ \
&& pull-patch.sh main/postfix
