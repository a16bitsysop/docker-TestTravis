FROM alpine:3.12

ARG ALP_VER=${ALP_VER:-3.12}
ARG BUILD_DATE
ARG VER
ARG VCS_REF=${TRAVIS_COMMIT}
ARG VCS_URL
ARG REPO=${TRAVIS_REPO_SLUG}

ENV ALP_VER=${ALP_VER} BUILD_DATE=${BUILD_DATE} VER=${VER} VCS_REF=${VCS_REF} VCS_URL=${VCS_URL} REPO=${REPO}

LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.build-date     = $BUILD_DATE
LABEL org.label-schema.version        = $VER
LABEL org.label-schema.vcs-ref        = $VCS_REF
LABEL org.label-schema.name           = $NAME
LABEL org.label-schema.description    = $DESC
LABEL alpine-version                  = $ALP_VER

RUN apk add bash

CMD [ "bash", "echo", "hello world edited too" ]
