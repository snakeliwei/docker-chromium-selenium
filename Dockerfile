FROM alpine:3.7
LABEL maintainer="lyndon <snakeliwei@gmail.com>"

ENV LANG C.UTF-8
ENV CHROMEDRIVER_VERSION 2.36
ENV CHROMEDRIVER_SHA256 2461384f541346bb882c997886f8976edc5a2e7559247c8642f599acd74c21d4

RUN apk add --no-cache --update 'su-exec>=0.2' tzdata curl xvfb chromium python3 unzip && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    pip3 install pytest selenium && \
    curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" && \
    echo "$CHROMEDRIVER_SHA256  chromedriver_linux64.zip" | sha256sum -c - && \
    unzip "chromedriver_linux64.zip" -d /usr/local/bin && \
    rm "chromedriver_linux64.zip" && \
    rm -rf /var/cache/apk/* 

