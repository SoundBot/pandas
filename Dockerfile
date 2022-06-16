FROM python:3.11.0b3-alpine3.15

RUN apk add wget alpine-sdk sudo

COPY py3-numpy.apk py3-numpy.apk 
RUN apk add ./py3-numpy.apk --allow-untrusted

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
RUN addgroup appuser abuild

RUN echo "%abuild ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/abuild

USER appuser
WORKDIR /home/appuser

ENV PYTHONPATH /usr/lib/python3.11/site-packages
RUN python3 -m pip install cython

RUN abuild-keygen -a -i -n

RUN wget https://git.alpinelinux.org/aports/plain/community/py3-pandas/APKBUILD

RUN abuild checksum && abuild -r
