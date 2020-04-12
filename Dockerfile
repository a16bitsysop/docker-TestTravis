FROM alpine:3.11

RUN apk add bash

CMD [ "bash", "echo", "hello world edited too" ]
