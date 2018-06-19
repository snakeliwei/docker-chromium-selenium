FROM alpine:3.7
LABEL maintainer="lyndon <snakeliwei@gmail.com>"

ENV LANG C.UTF-8
ENV CHROMEDRIVER_VERSION 2.40

COPY ./xvfb-chromium /usr/bin/xvfb-chromium
RUN apk add --no-cache --update 'su-exec>=0.2' tzdata bash curl xvfb chromium python3 unzip && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    pip install --upgrade pip pytest selenium && \
    curl -SLO "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip" && \
    unzip "chromedriver_linux64.zip" -d /usr/local/bin && \
    rm "chromedriver_linux64.zip" && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome && \
    ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser && \
    chmod +x /usr/bin/xvfb-chromium && \
    chmod +x /usr/local/bin/chromedriver 

