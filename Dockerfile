FROM python:3-alpine3.9
LABEL maintainer="lyndon <snakeliwei@gmail.com>"

# update apk repo
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories

ARG TZ="Asia/Shanghai"

RUN apk update && \
    apk add --no-cache bash \
            dhclient \
            xvfb \  
            chromium \
            chromium-chromedriver \
            wqy-zenhei \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/* \
            /usr/share/man \
            /tmp/*
    
# install selenium
RUN pip install selenium
