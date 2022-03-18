FROM cirss/repro-template:latest

COPY .repro .repro

USER repro

RUN repro.require go-dev exported --dev

CMD  /bin/bash -il
