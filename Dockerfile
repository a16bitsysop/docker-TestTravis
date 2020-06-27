FROM alpine:3.11

ARG BUILD_DATE=$BUILD_DATE
ARG ALP_VER=$ALP_VER
ARG PKG_VER=$PKG_VER
ARG URL=$URL
ARG GIT_COMMIT=$GIT_COMMIT

LABEL alpine-version                  = $ALP_VER
LABEL commit                          = $GIT_COMMIT
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.build-date     = $BUILD_DATE
LABEL org.label-schema.version        = $PKG_VER
LABEL org.label-schema.vcs-ref        = $ALP_VER
LABEL org.label-schema.url            = "https://github.com/$URL"
LABEL org.label-schema.vcs-url        = $GIT_COMMIT

RUN apk add bash

CMD [ "bash", "echo", "hello world edited too" ]
