FROM cirss/repro-template:latest

COPY  exports /repro/exports

USER repro

RUN repro.require go-dev exports

CMD  /bin/bash -il
