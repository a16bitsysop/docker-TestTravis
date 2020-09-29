FROM alpine:edge as builder

COPY pull-patch.sh /usr/local/bin
COPY APKBUILD.patch ./
COPY newfiles/* ./newfiles/

RUN apk add --update-cache alpine-conf alpine-sdk sudo \
&& apk upgrade -a \
&& chmod u+s /usr/bin/sudo
RUN adduser -D builduser \
    && addgroup builduser abuild \
    && echo 'builduser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
WORKDIR /home/builduser
RUN pull-patch.sh main/postfix \
&& chown builduser:builduser aport 

USER builduser
RUN abuild-keygen -a -i -n \
&& cd aport \
&& abuild checksum \
&& abuild -r
