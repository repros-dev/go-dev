FROM cirss/repro-parent:latest

COPY exports /repro/exports

ADD ${REPRO_DIST}/setup-boot /repro/dist/
RUN bash /repro/dist/setup-boot

USER repro

RUN repro.require repro master ${REPROS_DEV}
RUN repro.require go-dev exports

CMD  /bin/bash -il
