FROM python:3.11.0b3-alpine3.15

RUN apk add wget alpine-sdk sudo

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN addgroup appuser abuild

RUN echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/abuild

USER appuser
WORKDIR /home/appuser

COPY numpy-1.22.3-cp311-cp311-linux_x86_64.whl numpy-1.22.3-cp311-cp311-linux_x86_64.whl
RUN python3 -m pip install cython
RUN python3 -m pip install ./numpy-1.22.3-cp311-cp311-linux_x86_64.whl

RUN abuild-keygen -a -i -n

COPY APKBUILD APKBUILD

RUN abuild checksum && abuild -r
