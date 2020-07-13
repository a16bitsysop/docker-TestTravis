FROM alpine:3.12

RUN apk add bash

CMD [ "bash", "echo", "hello world edited too" ]
