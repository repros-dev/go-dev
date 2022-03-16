FROM cirss/repro-template:latest

COPY .repro .repro

USER repro

RUN repro.require go-dev exported --dev

RUN repro.setenv REPRO_BINARY_SHORT_NAME hello-go-repros

CMD  /bin/bash -il
