FROM alpine:3.8
LABEL maintainer="lyndon <snakeliwei@gmail.com>"

ENV LANG C.UTF-8

COPY ./xvfb-chromium /usr/bin/xvfb-chromium
RUN apk add --no-cache --update 'su-exec>=0.2' tzdata bash curl xvfb python3 unzip chromium chromium-chromedriver nss && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    pip3 install selenium && \
    rm -rf /var/cache/apk/* && \
    ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome && \
    ln -s /usr/bin/xvfb-chromium /usr/bin/chromium 
# Add Chrome as a user
RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app
# Run Chrome as non-privileged
USER chrome
WORKDIR /usr/src/app

ENV CHROME_BIN=/usr/bin/chromium \
    CHROME_PATH=/usr/lib/chromium/

EXPOSE 5900
CMD ["xvfb-chromium"]
